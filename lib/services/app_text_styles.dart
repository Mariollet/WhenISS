import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:keole/services/app_colors.dart";

abstract class AppTextStyles {
  static String fontFamily = dotenv.env["APP_FONT_FAMILY"]!;

  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle p = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static TextStyle button = TextStyle(
    fontSize: 18,
    fontFamily: fontFamily,
  );

  static TextStyle link = TextStyle(
    fontSize: 14,
    fontFamily: fontFamily,
  );

  static const TextStyle textInputLabel = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static const TextStyle formError = TextStyle(
    color: AppColors.error,
  );

  static const TextStyle copyright = TextStyle(
    color: AppColors.muted,
    fontSize: 12,
  );
}
