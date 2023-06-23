import "package:flutter/material.dart";
import "package:keole/services/index.dart";

const String fontFamily = "Jost";

abstract class AppTextStyles {
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle p = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
  );

  static const TextStyle link = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
  );

  static const TextStyle textInputLabel = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle formError = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.error,
  );

  static const TextStyle notFoundTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 80,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle notFoundDescription = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle snackBar = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.snackBar,
    fontSize: 12,
  );

  static const TextStyle copyright = TextStyle(
    fontFamily: fontFamily,
    color: AppColors.lightGrey,
    fontSize: 12,
  );
}
