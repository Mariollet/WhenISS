import "package:fl_starter/env.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fl_starter/data/api.dart";
import "package:fl_starter/data/models/index.dart";
import "package:fl_starter/services/index.dart";

final getUserRepository = FutureProvider<User>(
  (_) async {
    final response = Environment.appDebug == true
        ? {
            "id": 1,
            "gender": "Monsieur",
            "first_name": "John",
            "last_name": "Doe",
            "email": "John@Doe.com",
            "address": {
              "street": "1 rue des John",
              "zip_code": "12345",
              "city": "Johnstown",
            },
          }
        : await Api.get(ApiRoutes.getUser);

    if (response is Exception) throw response;

    return User.fromJson(response);
  },
);

final patchUserRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (_, request) async => await Api.patch(ApiRoutes.patchUser, body: request),
);
