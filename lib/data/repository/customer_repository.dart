import "package:fl_starter/data/api.dart";
import "package:fl_starter/services/api_routes.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final getCustomerLoginRepositoryProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>((ref, request) async {
  final Api api = ref.read(apiProvider);

  final response = await api.post(
    AppApi.getCustomer(request["customerId"]),
    {},
    true,
  );

  return response;
});

final postNewCustomerRepositoryProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>((ref, customer) async {
  final Api api = ref.read(apiProvider);

  final response = await api.post(
    AppApi.postNewCustomer,
    {
      "civility": "Monsieur",
      "firstName": "John",
      "lastName": "Doe",
      "email": customer['email'],
      "birthDate": customer['birthDate'].toString(),
    },
    true,
  );

  return response;
});

final patchValidateNewCustomerRepositoryProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, Map<String, dynamic>>((ref, request) async {
  final Api api = ref.read(apiProvider);

  final int customerId = request.remove("customerId");

  final response = await api.patch(
    AppApi.patchValidateNewCustomer(customerId),
    {
      ...request,
    },
  );

  return response;
});
