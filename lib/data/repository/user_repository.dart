import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/models.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/view_model/view_model.dart";

final getUserRepository = FutureProvider<User>(
  (_) async => User.fromJson(await Api.get(ApiRoutes.getUser)),
);

final patchUserRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async {
    final int userId =
        ref.watch(userProvider.select((User? user) => user!.id!));

    return await Api.patch(
      ApiRoutes.patchUser(userId),
      body: request,
    );
  },
);
