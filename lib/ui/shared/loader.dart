import "package:flutter/material.dart";

/// Loader based on the [CircularProgressIndicator] widget.
class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
  });

  /// Loader color.
  final Color? color;

  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        color: color,
        strokeWidth: 2,
      );
}
