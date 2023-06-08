import "package:flutter/cupertino.dart";

class Loader extends StatelessWidget {
  const Loader({super.key, this.radius = 12, this.color});

  final double radius;
  final Color? color;

  @override
  Widget build(final BuildContext context) => CupertinoActivityIndicator(
        color: color,
        radius: radius,
      );
}
