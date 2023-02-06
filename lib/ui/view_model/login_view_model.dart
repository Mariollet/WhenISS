import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/repository/login_repository.dart";

final loginProvider = Provider.autoDispose.family<Future, Map<String, dynamic>>(
  (ref, request) => ref.watch(loginRepository(request).future),
);

final isLoggedProvider = Provider.autoDispose<bool>(
  (ref) => ref.watch(getTokenRepository).when(
        data: (bool isLogged) => isLogged,
        error: (error, _) => throw Exception(error),
        loading: () => false,
      ),
);

final sendResetPasswordRequestProvider = Provider.autoDispose
    .family<Future<Map<String, dynamic>>, String>((ref, email) =>
        ref.watch(sendResetPasswordRequestRepository(email).future));

final clearSecureStorageProvider = Provider.autoDispose<bool>(
  (ref) => ref.watch(clearSecureStorageRepository).when(
        data: (bool cleared) => cleared,
        error: (error, _) => throw Exception(error),
        loading: () => false,
      ),
);
