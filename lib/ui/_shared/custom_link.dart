import 'package:fl_starter/services/app_text_styles.dart';
import "package:flutter/material.dart";

/// Generic link for single-line text with a dotted underline.
class CustomLink extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const CustomLink({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 11),
              child: Text(text, style: AppTextStyles.link),
            ),
            Positioned(
              bottom: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(text, style: AppTextStyles.dottedUnderline),
              ),
            ),
          ],
        ),
      );
}
