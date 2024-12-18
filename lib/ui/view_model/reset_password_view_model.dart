import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/data/repository/index.dart";

final resetPasswordProvider =
    FutureProvider.autoDispose.family<dynamic, String>(
  (ref, email) => ref.watch(postResetPasswordRepository(email).future),
);
