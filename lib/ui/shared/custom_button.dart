import "package:flutter/cupertino.dart";
import "package:studiokg/services/app_colors.dart";
import "package:studiokg/services/app_text_styles.dart";
import "package:studiokg/ui/shared/loader.dart";

const double fixedHeight = 56;

/// Generic button for single-line text.
/// The provided text is converted to uppercase.
/// If `expanded` is false, the button will have a width of 350px (similar to the text inputs).
/// If `expanded` is true, the button width will be relative and can be put inside an [Expanded] to cover the maximum space.
class CustomButton extends StatelessWidget {
  final double? width;
  final bool expanded;
  final double fixedWidth = 350;
  final String text;
  final bool disabled;
  final bool loading;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.width,
    this.expanded = false,
    required this.text,
    this.disabled = false,
    this.loading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => CupertinoTheme(
        data: const CupertinoThemeData(
          primaryColor: AppColors.grey,
        ),
        child: expanded
            ? Expanded(
                child: SizedBox(
                  height: fixedHeight,
                  child: getButton(),
                ),
              )
            : SizedBox(
                width: width ?? fixedWidth,
                height: fixedHeight,
                child: getButton(),
              ),
      );

  CupertinoButton getButton() => CupertinoButton.filled(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        borderRadius: BorderRadius.circular(fixedHeight),
        disabledColor: AppColors.grey,
        onPressed: loading || disabled ? null : onPressed,
        child: loading
            ? const Loader(color: AppColors.grey)
            : Text(
                text.toUpperCase(),
                style: AppTextStyles.button,
              ),
      );
}