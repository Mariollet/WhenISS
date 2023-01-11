import 'package:fl_starter/services/app_colors.dart';
import 'package:fl_starter/services/app_text_styles.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";

const double borderWidth = .8;
final BorderRadius borderRadius = BorderRadius.circular(50);

class CustomInput extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String label;
  final List<TextInputFormatter>? formatters;
  final void Function(dynamic)? onSaved;
  final int? maxLength;
  final bool disabled;
  final bool isPassword;

  const CustomInput({
    super.key,
    this.keyboardType,
    required this.controller,
    required this.validator,
    required this.label,
    this.formatters,
    this.onSaved,
    this.maxLength,
    this.disabled = false,
    this.isPassword = false,
  });

  @override
  CustomInputState createState() => CustomInputState();

  static OutlineInputBorder composeInputBorder(Color color) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth,
          color: color,
        ),
        borderRadius: borderRadius,
      );
}

class CustomInputState extends State<CustomInput> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 350,
        child: Theme(
          data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
              selectionColor: AppColors.grey[450],
            ),
          ),
          child: TextFormField(
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            validator: widget.validator,
            enabled: !widget.disabled,
            inputFormatters: widget.formatters,
            onSaved: widget.onSaved,
            maxLength: widget.maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            obscureText: widget.isPassword ? isObscured : false,
            obscuringCharacter: '●',
            autocorrect: !widget.isPassword,
            enableSuggestions: !widget.isPassword,
            cursorColor: AppColors.grey.shade400,
            style: TextStyle(
              color: widget.disabled ? AppColors.grey[425] : null,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 22,
              ),
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  widget.label,
                  style: AppTextStyles.selectLabel(
                    color: widget.disabled
                        ? AppColors.grey[425]!
                        : AppColors.grey.shade300,
                  ),
                ),
              ),
              suffixIcon: widget.isPassword
                  ? Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: IconButton(
                        splashRadius: 22,
                        icon: Icon(
                          isObscured
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 20,
                          color: AppColors.grey[425],
                        ),
                        onPressed: () =>
                            setState(() => isObscured = !isObscured),
                      ),
                    )
                  : null,
              disabledBorder:
                  CustomInput.composeInputBorder(AppColors.grey[425]!),
              enabledBorder:
                  CustomInput.composeInputBorder(AppColors.grey.shade400),
              focusedBorder:
                  CustomInput.composeInputBorder(AppColors.grey.shade400),
              errorBorder: CustomInput.composeInputBorder(AppColors.error),
              focusedErrorBorder:
                  CustomInput.composeInputBorder(AppColors.error),
            ),
          ),
        ),
      );
}
