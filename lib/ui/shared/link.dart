import "package:flutter/cupertino.dart";
import "package:keole/services/services.dart";

class Link extends StatelessWidget {
  const Link({
    super.key,
    required this.text,
    this.disabled = false,
    required this.onPressed,
  });

  final String text;
  final bool disabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: null,
        onPressed: disabled ? null : onPressed,
        child: Text(
          text,
          style: AppTextStyles.link,
          textAlign: TextAlign.center,
        ),
      );
}
