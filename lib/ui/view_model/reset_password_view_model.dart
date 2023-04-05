import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/repository/repository.dart";

final resetPasswordProvider =
    FutureProvider.autoDispose.family<dynamic, String>(
  (ref, email) => ref.watch(postResetPasswordRepository(email).future),
);
