import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/models/address.dart";
import "package:keole/data/models/customer.dart";
import "package:keole/data/repository/customer_repository.dart";

final customerProvider = StateNotifierProvider<CustomerNotifier, Customer>(
  (ref) => CustomerNotifier(ref.watch(getCustomerRepository)),
);

class CustomerNotifier extends StateNotifier<Customer> {
  CustomerNotifier(this.customer) : super(Customer.placeholder()) {
    customer.when(
      data: (Customer response) => state = response,
      error: (error, _) => throw Exception(error),
      loading: () {},
    );
  }

  final AsyncValue<Customer> customer;

  void setId(int id) => state = state.copyWith(id: id);

  void setCivility(Civility civility) =>
      state = state.copyWith(civility: civility);

  void setFirstName(String firstName) =>
      state = state.copyWith(firstName: firstName);

  void setLastName(String lastName) =>
      state = state.copyWith(lastName: lastName);

  void setEmail(String email) => state = state.copyWith(email: email);

  void setPhoneNumber(String phoneNumber) =>
      state = state.copyWith(phoneNumber: phoneNumber);

  void setBirthDate(DateTime birthDate) =>
      state = state.copyWith(birthDate: birthDate);

  void setAddress(Address address) => state = state.copyWith(address: address);
}
