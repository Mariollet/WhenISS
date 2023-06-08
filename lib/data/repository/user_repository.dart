import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/index.dart";
import "package:keole/services/index.dart";

final getUserRepository = FutureProvider<User>(
  (_) async {
    final response = await Api.get(ApiRoutes.getUser);

    if (response["code"] == 401) throw Exception(response["message"]);

    return User.fromJson(response);
  },
);

final patchUserRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (_, request) async => await Api.patch(ApiRoutes.patchUser, body: request),
);
