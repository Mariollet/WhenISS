import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:keole/extensions/validator.dart";
import "package:keole/services/services.dart";

String? emailValidator(String? value) {
  if (value!.isEmpty) return "Ce champ est requis.";
  if (!value.isValidEmail()) {
    return "Veuillez saisir une adresse e-mail valide.";
  }

  return null;
}

String? phoneNumberValidator(String? value) {
  if (value!.isEmpty) return "Ce champ est requis.";
  if (!value.isValidPhoneNumber()) {
    return "Veuillez saisir un numéro de téléphone valide.";
  }

  return null;
}

String? postalCodeValidator(String? value) {
  if (value!.isEmpty) return "Ce champ est requis.";
  if (!value.isValidPostalCode()) {
    return "Veuillez saisir un code postal valide.";
  }

  return null;
}

String? requiredValidator(String? value) {
  if (value!.isEmpty) return "Ce champ est requis.";

  return null;
}

/// Custom text input based on the [TextFormField] widget.
class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.controller,
    required this.validator,
    required this.placeholder,
    this.keyboardType,
    this.disabled = false,
    this.obscured = false,
    this.maxLength,
  });

  final TextEditingController controller;

  final String? Function(String?) validator;

  /// Helper label that describes the input field.
  final String placeholder;

  final TextInputType? keyboardType;

  /// If `true`, prevents focusing or editing the input.
  final bool disabled;

  /// If `true`, replaces each character with the symbol defined in [TextInputState] to mimic a password input.
  final bool obscured;

  /// If non-null, prevents entering more than [maxLength] characters.
  /// Displays a character counter below the input.
  final int? maxLength;

  @override
  TextInputState createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.placeholder,
          labelStyle: TextStyles.textInputLabel,
          suffixIcon: !widget.obscured
              ? null
              : IconButton(
                  splashRadius: 20,
                  onPressed: () => setState(() => obscured = !obscured),
                  icon: Icon(
                    obscured
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash_fill,
                  ),
                ),
        ),
        keyboardType: widget.obscured && !obscured
            ? TextInputType.visiblePassword
            : widget.keyboardType,
        obscuringCharacter: '•',
        obscureText: widget.obscured && obscured,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        maxLength: widget.maxLength,
        validator: widget.validator,
        enabled: !widget.disabled,
      );
}
