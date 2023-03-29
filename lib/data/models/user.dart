import "package:keole/data/models/address.dart";

class User {
  const User({
    this.id,
    required this.civility,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.address,
  });

  final int? id;
  final Civility civility;
  final String firstName, lastName, email, phone;
  final DateTime birthdate;
  final Address address;

  @override
  int get hashCode => id ?? 0;

  @override
  bool operator ==(dynamic other) => other is User && id == other.id;

  @override
  String toString() => "$firstName $lastName";

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        civility: Civility.fromJson(json["civility"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone_number"],
        birthdate: DateTime.parse(json["birth_date"]),
        address: Address.fromJSON(json["address"]),
      );

  User copyWith({
    int? id,
    Civility? civility,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    DateTime? birthdate,
    Address? address,
  }) =>
      User(
        id: id ?? this.id,
        civility: civility ?? this.civility,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        birthdate: birthdate ?? this.birthdate,
        address: address ?? this.address,
      );
}

enum Civility {
  mr("monsieur"),
  mrs("madame");

  const Civility(this.json);

  final String json;

  factory Civility.fromJson(String json) {
    switch (json) {
      case "Monsieur":
        return mr;
      case "Madame":
        return mrs;
      default:
        throw ArgumentError.value(json);
    }
  }

  String toJson() => json;
}
