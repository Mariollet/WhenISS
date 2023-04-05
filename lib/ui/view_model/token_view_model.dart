import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/repository/repository.dart";

final readTokenProvider = FutureProvider.autoDispose<String?>(
  (ref) => ref.watch(readTokenRepository.future),
);

final writeTokenProvider = FutureProvider.autoDispose.family<void, String>(
  (ref, token) => ref.watch(writeTokenRepository(token).future),
);
