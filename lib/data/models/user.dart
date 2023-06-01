import "package:keole/data/models/models.dart";

class User {
  User({
    this.id,
    required this.civility,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.birthdate,
    this.address,
  });

  final int? id;
  Civility civility;
  String firstName, lastName, email;
  Phone? phone;
  DateTime? birthdate;
  Address? address;

  @override
  int get hashCode => id ?? 0;

  @override
  bool operator ==(final dynamic other) => other is User && id == other.id;

  @override
  String toString() => "$firstName $lastName";

  factory User.fromJson(final Map<String, dynamic> json) => User(
        id: json["id"],
        civility: Civility.parse(json["gender"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: Phone.tryParse("${json["phone_number"]}"),
        birthdate: DateTime.tryParse("${json["birth_date"]}"),
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gender": civility.name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone?.toJson(),
        "birthdate": birthdate?.toString(),
        "address": address?.toJson(),
      };

  User copyWith({
    int? id,
    Civility? civility,
    String? firstName,
    String? lastName,
    String? email,
    Phone? phone,
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
