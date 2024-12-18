import 'package:flutter/material.dart';
import 'dart:math';

class StarrySkyPainter extends CustomPainter {
  final int starCount;
  final Color starColor;

  StarrySkyPainter({this.starCount = 100, this.starColor = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = starColor
      ..style = PaintingStyle.fill;

    final random = Random();

    for (int i = 0; i < starCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 2; // Star size (0-2 pixels)
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}