import "package:keole/data/models/address.dart";

class Customer {
  const Customer({
    required this.id,
    required this.civility,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.birthDate,
    required this.address,
  });

  final int id;
  final Civility civility;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final DateTime birthDate;
  final Address address;

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Customer && id == other.id;

  String get name => "$firstName $lastName";

  Customer copyWith({
    int? id,
    Civility? civility,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    DateTime? birthDate,
    Address? address,
  }) =>
      Customer(
        id: id ?? this.id,
        civility: civility ?? this.civility,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDate: birthDate ?? this.birthDate,
        address: address ?? this.address,
      );

  factory Customer.placeholder() => Customer(
        id: -1,
        civility: Civility.mr,
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        birthDate: DateTime.now(),
        address: Address(
          street: "86 rue Pierre et Marie-Curie",
          postalCode: "34430",
          city: "Saint-Jean-de-Védas",
        ),
      );

  factory Customer.fromJSON(Map<String, dynamic> json) => Customer(
        id: json["id"],
        civility: Civility.parse(json["civility"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        birthDate: DateTime.parse(json["birth_date"]),
        address: Address.parse(json["address"]),
      );
}

enum Civility {
  mr,
  mrs;

  factory Civility.parse(String string) {
    switch (string) {
      case "Monsieur":
        return mr;
      case "Madame":
        return mrs;
      default:
        throw Exception("Invalid civility.");
    }
  }
}
