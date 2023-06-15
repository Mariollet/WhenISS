import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jwt_decoder/jwt_decoder.dart";
import "package:keole/data/api.dart";
import "package:keole/ui/view_model/index.dart";

final readTokenRepository = FutureProvider.autoDispose<bool>(
  (ref) async {
    final token = await Api.secureStorage.read(key: "token");
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

    return isLogged;
  },
);

final writeTokenRepository = FutureProvider.autoDispose.family<void, String>(
  (ref, token) async {
    await Api.secureStorage.write(key: "token", value: token);

    ref.read(isLoggedProvider.notifier).state = true;
  },
);

final deleteTokenRepository = FutureProvider.autoDispose<void>(
  (ref) async {
    await Api.secureStorage.delete(key: "token");

    ref.read(isLoggedProvider.notifier).state = false;
    ref.read(userProvider.notifier).state = null;
  },
);
