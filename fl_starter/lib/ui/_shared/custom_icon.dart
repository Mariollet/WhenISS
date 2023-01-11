import "package:flutter/material.dart";

/// Custom icon class with a rounded colored background.
class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double backgroundSize;
  final Color iconColor;
  final Color backgroundColor;

  const CustomIcon(
    this.icon, {
    super.key,
    this.iconSize = 22,
    this.backgroundSize = 28,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        width: backgroundSize,
        height: backgroundSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      );
}
