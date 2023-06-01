class Address {
  Address({
    required this.street,
    this.complement,
    required this.postalCode,
    required this.city,
  });

  final String street, postalCode, city;
  final String? complement;

  factory Address.fromJson(final Map<String, dynamic> json) => Address(
        street: json["street"],
        complement: json["complement"],
        postalCode: json["zip_code"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "complement": complement,
        "zip_code": postalCode,
        "city": city,
      };
}
