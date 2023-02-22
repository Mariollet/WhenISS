import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/customer.dart";
import "package:keole/services/api_routes.dart";
import "package:keole/ui/view_model/customer_view_model.dart";

final getCustomerRepository = FutureProvider<Customer>(
  (ref) async => Customer.fromJSON(await API.get(APIRoutes.getCustomer)),
);

final patchCustomerRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
  (ref, request) async {
    final int customerId =
        ref.watch(customerProvider.select((Customer customer) => customer.id));

    return await API.patch(APIRoutes.patchCustomer(customerId), request);
  },
);
