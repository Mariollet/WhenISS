class Address {
  Address({
    required this.street,
    this.complement,
    required this.postalCode,
    required this.city,
  });

  final String street;
  final String? complement;
  final String postalCode;
  final String city;

  factory Address.parse(Map<String, dynamic> json) => Address(
        street: json["street"],
        complement: json["complement"],
        postalCode: json["postal_code"],
        city: json["city"],
      );

  Map<String, dynamic> stringify() => {
        "street": street,
        "complement": complement,
        "postalCode": postalCode,
        "city": city,
      };
}
