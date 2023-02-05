import "package:flutter/material.dart";
import "package:keole/services/app_colors.dart";

abstract class AppTextStyles {
  static TextStyle defaultStyle = TextStyle(
    color: AppColors.grey.shade400,
    fontSize: 20,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
  );

  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
  );

  static const TextStyle p = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
  );

  static const TextStyle formError = TextStyle(
    color: AppColors.error,
  );

  static const TextStyle snackBar = TextStyle(
    fontFamily: "Montserrat",
  );
}
