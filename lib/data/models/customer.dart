class Customer {
  const Customer({
    required this.id,
    required this.civility,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final int id;
  final Civility civility;
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
    Civility? civility,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      Customer(
        id: id ?? this.id,
        civility: civility ?? this.civility,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
      );

  factory Customer.placeholder() => const Customer(
        id: 0,
        civility: Civility.mr,
        firstName: '',
        lastName: '',
        email: '',
      );

  factory Customer.fromJSON(Map<String, dynamic> json) => Customer(
        id: json["id"],
        civility: getCivilityFromJSON(json["civility"])!,
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
      );

  static Civility? getCivilityFromJSON(String civility) {
    switch (civility) {
      case "Monsieur":
        return Civility.mr;
      case "Madame":
        return Civility.mrs;
      default:
        return null;
    }
  }
}

enum Civility {
  mr,
  mrs,
}
