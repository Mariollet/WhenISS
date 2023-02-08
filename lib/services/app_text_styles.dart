import "package:flutter/material.dart";
import "package:keole/services/app_colors.dart";

abstract class AppTextStyles {
  static const String fontFamily = "Montserrat";

  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static const TextStyle p = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: fontFamily,
  );

  static const TextStyle formError = TextStyle(
    color: AppColors.error,
  );

  static const TextStyle snackBar = TextStyle(
    fontFamily: fontFamily,
  );

  static const TextStyle button = TextStyle(
    fontSize: 18,
    letterSpacing: .2,
    fontFamily: fontFamily,
  );

  static const TextStyle textInputLabel = TextStyle(
    fontWeight: FontWeight.w500,
  );
}
