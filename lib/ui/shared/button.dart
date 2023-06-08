import "package:flutter/cupertino.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/shared/index.dart";

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.size,
    required this.text,
    this.disabled = false,
    this.loading = false,
    required this.onPressed,
  });

  final ButtonSize size;
  final String text;
  final bool disabled, loading;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: size.width,
        height: size.height,
        child: CupertinoButton.filled(
          padding: EdgeInsets.zero,
          disabledColor: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(size.height * .5),
          onPressed: disabled || loading ? null : onPressed,
          child: loading
              ? const Loader(color: AppColors.white)
              : Text(text, style: AppTextStyles.button),
        ),
      );
}

enum ButtonSize {
  m(300, 50);

  const ButtonSize(this.width, this.height);

  final double width, height;
}
