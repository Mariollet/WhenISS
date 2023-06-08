import "package:flutter/cupertino.dart";

class Link extends StatelessWidget {
  const Link({super.key, required this.onPressed, required this.child});

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(final BuildContext context) => CupertinoButton(
        padding: EdgeInsets.zero,
        minSize: null,
        onPressed: onPressed,
        child: child,
      );
}
