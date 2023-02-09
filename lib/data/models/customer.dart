class Customer {
  const Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;

  @override
  int get hashCode => id;

  @override
  bool operator ==(other) => other is Customer && id == other.id;

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

  factory Customer.placeholder() => const Customer(
        id: 0,
        firstName: '',
        lastName: '',
        email: '',
      );

  factory Customer.fromJSON(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
      );
}
