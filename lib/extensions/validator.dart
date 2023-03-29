extension Validator on String {
  bool isValidEmail() => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool isValidPassword() =>
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(this);

  bool isValidPhoneNumber() => RegExp(r"^(33|0)(6|7|9)\d{8}$").hasMatch(this);

  bool isValidPostalCode() => RegExp(r"^\d{5}$").hasMatch(this);

  bool isValid4DigitCode() => RegExp(r"^\d{4}$").hasMatch(this);
}
