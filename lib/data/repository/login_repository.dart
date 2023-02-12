import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/services/api_routes.dart";

final loginRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async => await API.authenticate(request),
);

final getTokenRepository = FutureProvider.autoDispose<bool>(
  (ref) async => await API.storage.read(key: "token") != null,
);

final sendResetPasswordRequestRepository =
    FutureProvider.autoDispose.family<Map<String, dynamic>, String>(
  (ref, email) async => await API.post(
    APIRoutes.forgotPassword,
    {
      "email": email,
    },
    false,
  ),
);

final clearSecureStorageRepository =
    FutureProvider.autoDispose<bool>((ref) async {
  await API.storage.deleteAll();

  return true;
});
