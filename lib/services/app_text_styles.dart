import "package:flutter/material.dart";
import "package:fl_starter/services/app_colors.dart";
import "package:fl_starter/services/index.dart";

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

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bolder = TextStyle(
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bigbolder = TextStyle(
    fontWeight: FontWeight.w700,
  );

  static const TextStyle extraBold = TextStyle(
    fontWeight: FontWeight.w900,
  );
}
