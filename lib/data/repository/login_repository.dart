import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/services/services.dart";

final postLoginRepository =
    FutureProvider.autoDispose.family<void, Map<String, dynamic>>(
  (_, credentials) async {
    final response = await Api.post(
      ApiRoutes.login,
      body: credentials,
      authorizationHeader: false,
    );

    if (response["code"] == 401) throw Exception(response["message"]);

    await Api.secureStorage.write(key: "token", value: response["token"]);
  },
);

final deleteLogoutRepository = FutureProvider.autoDispose<void>(
  (_) async => await Api.secureStorage.delete(key: "token"),
);

final getJwtRepository = FutureProvider.autoDispose<bool>(
  (_) async => await Api.secureStorage.read(key: "token") != null,
);
