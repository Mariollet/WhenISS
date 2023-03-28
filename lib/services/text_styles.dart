import "package:flutter/material.dart";
import "package:keole/services/services.dart";

const String fontFamily = "Jost";

abstract class TextStyles {
  static const TextStyle h1 = TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      p = TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      button = TextStyle(
        fontSize: 18,
        fontFamily: fontFamily,
      ),
      link = TextStyle(
        fontSize: 14,
        fontFamily: fontFamily,
      ),
      textInputLabel = TextStyle(
        fontWeight: FontWeight.w500,
      ),
      formError = TextStyle(
        color: AppColors.error,
      ),
      copyright = TextStyle(
        color: AppColors.muted,
        fontSize: 12,
      );
}
