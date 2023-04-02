import "package:flutter/material.dart";
import "package:keole/services/services.dart";

void showSnackBar(String message) =>
    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        content: Text(message, style: AppTextStyles.snackBar),
        backgroundColor: AppColors.snackBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        behavior: SnackBarBehavior.floating,
      ),
    );
