class Customer {
  const Customer({
    this.id = 0,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;

  String get name => "$firstName $lastName";

  Customer copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      Customer(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
      );

  factory Customer.fromJSON(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
      );
}
