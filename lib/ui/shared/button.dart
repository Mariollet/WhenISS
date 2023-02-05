import "package:flutter/material.dart";
import "package:keole/services/app_colors.dart";
import "package:keole/ui/shared/loader.dart";

/// Generic button based on the [TextButton] widget.
class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.disabled = false,
    this.loading = false,
    this.onPressed,
  });

  /// The text to display on the button.
  final String text;

  /// If `true`, disables and fades the button. The [text] content stays visible.
  final bool disabled;

  /// If `true`, disables the button and replaces its [text] content with a [Loader].
  final bool loading;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: disabled || loading ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
        ),
        child: loading
            ? const SizedBox.square(
                dimension: 16,
                child: Loader(
                  color: AppColors.white,
                ),
              )
            : Text(text),
      );
}
