/* import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/models/customer.dart";
import "package:keole/data/repository/customer_repository.dart";

// Customer Provider
final customerProvider = StateNotifierProvider<CustomerNotifier, Customer>(
    (ref) => CustomerNotifier());

class CustomerNotifier extends StateNotifier<Customer> {
  CustomerNotifier() : super(const Customer());

  void set(Customer customer) => state = customer;

  void setFromJSON(Map<String, dynamic> json) =>
      state = Customer.fromJSON(json);

  void setId(int id) => state = state.copyWith(
        id: id,
      );

  void setFirstName(String firstName) => state = state.copyWith(
        firstName: firstName,
      );

  void setLastName(String lastName) => state = state.copyWith(
        lastName: lastName,
      );

  void setEmail(String? email) => state = state.copyWith(
        email: email,
      );

  void setBirthDate(DateTime? birthDate) => state = state.copyWith(
        birthDate: birthDate,
      );
}

// Returns true if the customer has an id
final customerHasId = Provider<bool>((ref) {
  final bool hasId = ref.watch(
      customerProvider.select((Customer customer) => customer.id != null));

  return hasId;
});

// Customer Login Provider
final getCustomerLoginProvider = StateNotifierProvider.autoDispose.family<
    GetCustomerLoginNotifier,
    Map<String, dynamic>?,
    Map<String, dynamic>>((ref, request) {
  final AsyncValue<Map<String, dynamic>> response =
      ref.watch(getCustomerLoginRepositoryProvider(request));

  return GetCustomerLoginNotifier(
    response: response,
  );
});

class GetCustomerLoginNotifier extends StateNotifier<Map<String, dynamic>?> {
  final AsyncValue<Map<String, dynamic>> response;

  GetCustomerLoginNotifier({
    required this.response,
  }) : super(null) {
    response.when(
      loading: () {},
      error: (error, stack) => throw Exception("An error occurred: $error"),
      data: (response) => setResponse(response),
    );
  }

  void setResponse(Map<String, dynamic> response) => state = response;
}
 */