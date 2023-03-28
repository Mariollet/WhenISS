import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/user.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/view_model/customer_view_model.dart";

final getCustomerRepository = FutureProvider<User>(
  (ref) async => User.fromJson(await API.get(APIRoutes.getCustomer)),
);

final patchCustomerRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async {
    final int userId =
        ref.watch(userProvider.select((User? user) => user!.id!));

    return await API.patch(APIRoutes.patchCustomer(userId), request);
  },
);
