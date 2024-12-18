import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/data/repository/index.dart";

final loginProvider =
    FutureProvider.autoDispose.family<dynamic, Map<String, dynamic>>(
  (ref, credentials) => ref.watch(postLoginRepository(credentials).future),
);

final isLoggedProvider = StateProvider<bool>((_) => false);

final logoutProvider = FutureProvider.autoDispose<void>(
  (ref) => ref.watch(deleteTokenRepository.future),
);
