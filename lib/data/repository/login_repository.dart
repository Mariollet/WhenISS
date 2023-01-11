import "package:fl_starter/data/api.dart";
import "package:fl_starter/services/api_routes.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

final getTokenRepositoryProvider = FutureProvider.autoDispose
    .family<String?, Map<String, dynamic>>((ref, credentials) async {
  final Api api = ref.read(apiProvider);

  return api.getToken(credentials);
});

final checkTokenRepositoryProvider = FutureProvider<bool>((ref) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();

  String? token = await storage.read(key: "token");

  return token != null && token != '';
});

final forgotPasswordRepositoryProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>?, String?>((ref, email) async {
  final Api api = ref.read(apiProvider);

  final response = await api.post(
    AppApi.forgotPassword,
    {
      "email": email,
    },
    false,
  );

  if (response["code"] != 400 && response["success"]) return null;

  return response;
});

final clearSecureStorageRepositoryProvider =
    FutureProvider.autoDispose<bool>((ref) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();

  await storage.deleteAll();

  return true;
});
