import "package:flutter/material.dart";
import "package:keole/services/index.dart";

const String fontFamily = "Jost";

abstract class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle p = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
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

  static const TextStyle formError = TextStyle(
    color: AppColors.error,
  );

  static const TextStyle notFoundTitle = TextStyle(
    fontSize: 80,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle notFoundDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle snackBar = TextStyle(
    color: AppColors.snackBar,
    fontSize: 12,
    fontFamily: fontFamily,
  );

  static const TextStyle copyright = TextStyle(
    color: AppColors.lightgrey,
    fontSize: 12,
  );
}
