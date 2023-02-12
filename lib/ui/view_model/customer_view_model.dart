import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/models/customer.dart";

final customerProvider = StateNotifierProvider<CustomerNotifier, Customer>(
    (ref) => CustomerNotifier());

class CustomerNotifier extends StateNotifier<Customer> {
  CustomerNotifier() : super(Customer.placeholder());

  void setId(int id) => state = state.copyWith(id: id);

  void setCivility(Civility civility) =>
      state = state.copyWith(civility: civility);

  void setFirstName(String firstName) =>
      state = state.copyWith(firstName: firstName);

  void setLastName(String lastName) =>
      state = state.copyWith(lastName: lastName);

  void setEmail(String email) => state = state.copyWith(email: email);
}
