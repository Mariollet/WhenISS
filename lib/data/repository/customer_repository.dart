import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/services/api_routes.dart";

final getCustomerLoginRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
        (ref, request) async => await api.post(
              APIRoutes.getCustomer(request["customerId"]),
              {},
            ));

final postNewCustomerRepository = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>(
        (ref, request) async => await api.post(
              APIRoutes.postNewCustomer,
              request,
            ));
