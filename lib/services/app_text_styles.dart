import "package:flutter/material.dart";
import "package:keole/services/app_colors.dart";

abstract class AppTextStyles {
  static const String fontFamily = "Jost";

  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle p = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle formError = TextStyle(
    color: AppColors.error,
  );

  static const TextStyle snackBar = TextStyle(
    fontFamily: fontFamily,
  );

  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontFamily: fontFamily,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
  );

  static const TextStyle textInputLabel = TextStyle(
    fontWeight: FontWeight.w500,
  );
}
