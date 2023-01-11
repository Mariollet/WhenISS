class Customer {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final DateTime? birthDate;

  const Customer({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.birthDate,
  });

  Customer copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    DateTime? birthDate,
  }) =>
      Customer(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
      );

  factory Customer.fromJSON(Map<String, dynamic> json) {
    return Customer(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      birthDate: DateTime.parse(json["birth_date"]),
    );
  }
}
