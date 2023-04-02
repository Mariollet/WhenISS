import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/models.dart";
import "package:keole/services/services.dart";

final getUserRepository = FutureProvider<User>(
  (_) async {
    final response = await Api.get(ApiRoutes.getUser);

    return User.fromJson(response);
  },
);

final patchUserRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async => await Api.patch(ApiRoutes.patchUser, body: request),
);
