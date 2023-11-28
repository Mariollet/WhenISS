import "package:flutter/material.dart";
import "package:studiokg/services/index.dart";

void showSnackBar(final String message) =>
    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        content: Text(message, style: AppTextStyles.snackBar),
        backgroundColor: AppColors.snackBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
      ),
    );
