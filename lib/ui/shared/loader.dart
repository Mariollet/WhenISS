import "package:flutter/cupertino.dart";

/// Loader based on the [CupertinoActivityIndicator] widget.
class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.radius,
    this.color,
  });

  /// Loader radius. Defaults to 12.
  final double? radius;

  /// Loader color.
  final Color? color;

  @override
  Widget build(BuildContext context) => CupertinoActivityIndicator(
        color: color,
        radius: radius ?? 12,
      );
}
