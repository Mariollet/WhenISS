extension Validator on String {
  bool isValidEmail() => _email.hasMatch(this);
  bool isValidPhoneNumber() => _phone.hasMatch(this);
  bool isValidPostalCode() => _postalCode.hasMatch(this);
  bool isValid4DigitCode() => _fourDigitCode.hasMatch(this);
}

final RegExp _email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ),
    _phone = RegExp(r"^(33|0)(6|7|9)\d{8}$"),
    _postalCode = RegExp(r"^\d{5}$"),
    _fourDigitCode = RegExp(r"^\d{4}$");
