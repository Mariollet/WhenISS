import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/user.dart";
import "package:keole/services/services.dart";
import 'package:keole/ui/view_model/user_view_model.dart';

final getUserRepository = FutureProvider<User>(
  (_) async => User.fromJson(await Api.get(APIRoutes.getUser)),
);

final patchUserRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async {
    final int userId =
        ref.watch(userProvider.select((User? user) => user!.id!));

    return await Api.patch(APIRoutes.patchUser(userId), request);
  },
);
