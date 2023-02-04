import "package:keole/data/api.dart";
import "package:keole/services/api_routes.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final getCustomerLoginRepositoryProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>((ref, request) async {
  final response = await api.post(
    APIRoutes.getCustomer(request["customerId"]),
    {},
  );

  return response;
});

final postNewCustomerRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
        (ref, request) async => await api.post(
              APIRoutes.postNewCustomer,
              request,
            ));
