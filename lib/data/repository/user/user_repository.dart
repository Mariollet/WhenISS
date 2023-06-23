import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/new_api.dart";
import "package:keole/data/models/index.dart";
import "package:keole/services/index.dart";

final getUserRepository = FutureProvider<User>(
  (_) async {
    // final response = await Api.get(ApiRoutes.getUser);
    final response = {
      "id": 1,
      "gender": "Monsieur",
      "first_name": "Bob",
      "last_name": "Bob",
      "email": "bobbob@yahoo.com",
      "address": {
        "street": "1 rue des losanges",
        "zip_code": "12345",
        "city": "Chameaubourg",
      },
    };

    if (response is Exception) throw response;

    return User.fromJson(response);
  },
);

final patchUserRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (_, request) async => await Api.patch(ApiRoutes.patchUser, body: request),
);
