import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";

final postLoginRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (_, request) async => await Api.authenticate(request),
);

final getTokenRepository = FutureProvider.autoDispose<bool>(
  (_) async => await Api.secureStorage.read(key: "token") != null,
);

final logoutRepository = FutureProvider.autoDispose<void>(
  (_) async => await Api.secureStorage.delete(key: "token"),
);
