import "package:flutter/cupertino.dart";
import "package:keole/services/app_text_styles.dart";

class Link extends StatelessWidget {
  const Link({
    super.key,
    required this.text,
    this.disabled = false,
    this.onPressed,
  });

  /// The text to display on the link.
  final String text;

  /// If `true`, disables and fades the link. The [text] content stays visible.
  final bool disabled;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: null,
        onPressed: disabled ? null : onPressed,
        child: Text(text, style: AppTextStyles.link),
      );
}
