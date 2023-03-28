import "package:flutter/cupertino.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/loader.dart";

/// Generic button based on the [CupertinoButton] widget.
class Button extends StatelessWidget {
  const Button({
    super.key,
    this.width,
    required this.text,
    this.disabled = false,
    this.loading = false,
    this.onPressed,
  });

  /// An optional width for the button.
  final double? width;

  /// The text to display on the button.
  final String text;

  /// If `true`, disables and fades the button. The [text] content stays visible.
  final bool disabled;

  /// If `true`, disables the button and replaces its [text] content with a [Loader].
  final bool loading;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: 50,
        child: CupertinoButton.filled(
          padding: EdgeInsets.zero,
          disabledColor: AppColors.primary,
          borderRadius: BorderRadius.circular(27),
          onPressed: disabled || loading ? null : onPressed,
          child: loading
              ? const Loader(color: AppColors.white)
              : Text(text, style: TextStyles.button),
        ),
      );
}
