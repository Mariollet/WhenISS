import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/repository/repository.dart";

final loginProvider =
    Provider.autoDispose.family<Future<dynamic>, Map<String, dynamic>>(
  (ref, credentials) => ref.watch(postLoginRepository(credentials).future),
);

// TODO: JWT expiration check
final isLoggedProvider = FutureProvider.autoDispose<bool>(
  (ref) => ref.watch(getJwtRepository.future),
);

final isLoggedStateProvider = StateProvider<bool>((_) => false);

final logoutProvider = FutureProvider.autoDispose<void>(
  (ref) => ref.watch(deleteLogoutRepository.future),
);
