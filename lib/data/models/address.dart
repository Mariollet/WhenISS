class Address {
  Address({
    required this.street,
    this.complement,
    required this.postalCode,
    required this.city,
  });

  final String street, postalCode, city;
  final String? complement;

  factory Address.fromJSON(Map<String, dynamic> json) => Address(
        street: json["street"],
        complement: json["complement"],
        postalCode: json["postal_code"],
        city: json["city"],
      );

  Map<String, dynamic> toJSON() => {
        "street": street,
        "complement": complement,
        "postal_code": postalCode,
        "city": city,
      };
}
