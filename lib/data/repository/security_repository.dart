import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/services/services.dart";

final loginRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async => await Api.authenticate(request),
);

final getTokenRepository = FutureProvider.autoDispose<bool>(
  (ref) async => await Api.secureStorage.read(key: "token") != null,
);

final sendResetPasswordRequestRepository =
    FutureProvider.autoDispose.family<Map<String, dynamic>, String>(
  (ref, email) async => await Api.post(
    ApiRoutes.forgotPassword,
    {"email": email},
    false,
  ),
);

final logoutRepository = FutureProvider.autoDispose<void>(
  (_) async => await Api.secureStorage.delete(key: "token"),
);
