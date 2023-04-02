import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/repository/repository.dart";

final resetPasswordProvider =
    Provider.autoDispose.family<Future<dynamic>, String>(
  (ref, email) => ref.watch(postResetPasswordRepository(email).future),
);
