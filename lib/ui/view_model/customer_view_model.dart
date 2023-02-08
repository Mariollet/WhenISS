import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/models/customer.dart";

final customerProvider = StateNotifierProvider<CustomerNotifier, Customer>(
    (ref) => CustomerNotifier());

class CustomerNotifier extends StateNotifier<Customer> {
  CustomerNotifier() : super(Customer.empty());
}
