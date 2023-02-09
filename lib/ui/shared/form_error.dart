import "package:flutter/material.dart";
import "package:keole/services/app_text_styles.dart";

/// Generic container for a form error message.
class FormError extends StatelessWidget {
  const FormError(
    this.message, {
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) => Text(
        message,
        style: AppTextStyles.formError,
        textAlign: TextAlign.center,
      );
}
