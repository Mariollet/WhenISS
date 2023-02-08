import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:keole/extensions/validator.dart";
import "package:keole/services/app_text_styles.dart";

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

  // final TextInputType
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

  factory TextInput.email({
    required TextEditingController controller,
    bool disabled = false,
  }) =>
      TextInput(
        controller: controller,
        validator: (String? value) {
          if (value!.isEmpty) return "Ce champ est requis.";
          if (!value.isValidEmail()) return "Veuillez saisir un e-mail valide.";

          return null;
        },
        placeholder: "E-mail",
        keyboardType: TextInputType.emailAddress,
        disabled: disabled,
      );

  factory TextInput.password({
    required TextEditingController controller,
    bool disabled = false,
    bool obscured = false,
  }) =>
      TextInput(
        controller: controller,
        validator: (String? value) {
          if (value!.isEmpty) return "Ce champ est requis.";

          return null;
        },
        placeholder: "Mot de passe",
        disabled: disabled,
        obscured: obscured,
      );
}

class TextInputState extends State<TextInput> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.placeholder,
          labelStyle: AppTextStyles.textInputLabel,
          suffixIcon: !widget.obscured
              ? null
              : IconButton(
                  splashRadius: 20,
                  onPressed: () => setState(() => obscured = !obscured),
                  icon: Icon(
                    obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                ),
        ),
        keyboardType: widget.keyboardType,
        obscuringCharacter: '•',
        obscureText: widget.obscured && obscured,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        maxLength: widget.maxLength,
        validator: widget.validator,
        enabled: !widget.disabled,
      );
}
