import "package:flutter/cupertino.dart";

class CustomLoader extends StatelessWidget {
  final double radius;
  final Color? color;

  const CustomLoader({
    super.key,
    this.radius = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) => CupertinoActivityIndicator(
        radius: radius,
        color: color,
      );
}
