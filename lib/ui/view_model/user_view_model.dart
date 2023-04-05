import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/models/models.dart";
import "package:keole/data/repository/repository.dart";

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) => UserNotifier(user: ref.watch(getUserRepository)),
);

class UserNotifier extends StateNotifier<User?> {
  UserNotifier({required this.user}) : super(null) {
    user.when(
      data: (User user) => state = user,
      error: (Object error, _) => throw Exception("userProvider: $error"),
      loading: () {},
    );
  }

  final AsyncValue<User> user;

  void setId(int id) => state!.copyWith(id: id);

  void setCivility(Civility civility) => state!.copyWith(civility: civility);

  void setFirstName(String firstName) => state!.copyWith(firstName: firstName);

  void setLastName(String lastName) => state!.copyWith(lastName: lastName);

  void setEmail(String email) => state!.copyWith(email: email);

  void setPhone(String phone) => state!.copyWith(phone: phone);

  void setBirthdate(DateTime birthdate) =>
      state!.copyWith(birthdate: birthdate);

  void setAddress(Address address) => state!.copyWith(address: address);
}
