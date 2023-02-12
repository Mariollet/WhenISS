import "package:context_holder/context_holder.dart";
import "package:flutter/material.dart";
import "package:keole/services/app_text_styles.dart";

void showSnackBar(String message) {
  final SnackBar snackBar = SnackBar(
    content: Text(message, style: AppTextStyles.snackBar),
    duration: const Duration(seconds: 6),
  );

  ScaffoldMessenger.of(ContextHolder.currentContext).showSnackBar(snackBar);
}
