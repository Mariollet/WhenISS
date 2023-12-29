import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jwt_decoder/jwt_decoder.dart";
import "package:studiokg/data/api.dart";
import "package:studiokg/data/models/user/user.dart";
import "package:studiokg/data/repository/user/user_repository.dart";
import "package:studiokg/ui/view_model/index.dart";

final readTokenRepository = FutureProvider.autoDispose<bool>(
  (ref) async {
    try {
      await Api.secureStorage.read(key: "jwt");
    } catch (e) {
      await ref.read(deleteTokenRepository.future);
    }
    final token = await Api.secureStorage.read(key: "jwt");

    bool isLogged;

    if (token != null) {
      try {
        isLogged = !JwtDecoder.isExpired(token);
      } on FormatException {
        isLogged = false;
      }

      if (!isLogged) await ref.read(logoutProvider.future);
    } else {
      isLogged = false;
    }

    final User? user = ref.read(userProvider);

    if (user == null) {
      try {
        final User? connectedUser = await ref.read(getUserRepository.future);

        ref.read(userProvider.notifier).state = connectedUser;
      } catch (e) {
        ref.read(userProvider.notifier).state = null;

        isLogged = false;
        return isLogged;
      }
    }

    return isLogged;
  },
);

final writeTokenRepository = FutureProvider.autoDispose.family<void, String>(
  (ref, token) async {
    await Api.secureStorage.write(key: "jwt", value: token);

    ref.read(isLoggedProvider.notifier).state = true;
  },
);

final deleteTokenRepository = FutureProvider.autoDispose<void>(
  (ref) async {
    await Api.secureStorage.delete(key: "jwt");

    ref.read(isLoggedProvider.notifier).state = false;
    ref.read(userProvider.notifier).state = null;
  },
);
