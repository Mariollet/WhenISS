import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/repository/repository.dart";

final loginProvider = Provider.autoDispose
    .family<Future<Map<String, dynamic>>, Map<String, dynamic>>(
  (ref, request) => ref.watch(loginRepository(request).future),
);

// TODO: JWT expiration check
final isLoggedProvider = FutureProvider.autoDispose<bool>(
  (ref) => ref.watch(getTokenRepository.future),
);

final sendResetPasswordRequestProvider =
    Provider.autoDispose.family<Future<Map<String, dynamic>>, String>(
  (ref, email) => ref.watch(sendResetPasswordRequestRepository(email).future),
);

final logoutProvider = FutureProvider.autoDispose<void>(
  (_) async => await Api.secureStorage.delete(key: "token"),
);
