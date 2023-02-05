import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";

final loginRepository = FutureProvider.autoDispose
    .family<dynamic, Map<String, dynamic>>(
        (ref, request) async => await api.authenticate(request));

final getTokenRepository = FutureProvider.autoDispose<bool>(
    (ref) async => await api.storage.read(key: "token") != null);

final clearSecureStorageRepository =
    FutureProvider.autoDispose<bool>((ref) async {
  await api.storage.deleteAll();

  return true;
});

/* final checkTokenRepositoryProvider = FutureProvider<bool>((ref) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();

  String? token = await storage.read(key: "token");

  return token != null && token != '';
});

final forgotPasswordRepositoryProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>?, String?>((ref, email) async {
  final Api api = ref.read(apiProvider);

  final response = await api.post(
    APIRoutes.forgotPassword,
    {
      "email": email,
    },
    false,
  );

  if (response["code"] != 400 && response["success"]) return null;

  return response;
});
 */