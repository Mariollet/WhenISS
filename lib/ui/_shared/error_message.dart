import 'package:fl_starter/services/app_text_styles.dart';
import "package:flutter/material.dart";

class CustomErrorMessage extends StatelessWidget {
  final String message;

  const CustomErrorMessage(
    this.message, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: Text(
          message,
          style: AppTextStyles.error,
        ),
      );
}
