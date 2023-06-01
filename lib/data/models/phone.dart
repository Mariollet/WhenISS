import "package:keole/extensions/extensions.dart";

class Phone {
  const Phone({required this.number});

  final String number;

  factory Phone.parse(final String number) {
    if (!number.isValidPhoneNumber()) throw FormatException;

    return Phone(number: number);
  }

  static Phone? tryParse(final String number) {
    try {
      return Phone.parse(number);
    } on FormatException {
      return null;
    }
  }

  // TODO: Dynamic country ISO?
  Map<String, dynamic> toJson() => {
        "country": "FR",
        "number": number,
      };
}
