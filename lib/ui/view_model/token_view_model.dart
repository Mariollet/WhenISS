import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fl_starter/data/repository/index.dart";

final readTokenProvider = FutureProvider.autoDispose<bool>(
  (ref) => ref.watch(readTokenRepository.future),
);

final writeTokenProvider = FutureProvider.autoDispose.family<void, String>(
  (ref, token) => ref.watch(writeTokenRepository(token).future),
);
