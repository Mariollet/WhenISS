import "package:flutter/material.dart";
import "package:keole/services/services.dart";

const String fontFamily = "Jost";

abstract class TextStyles {
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

  static const TextStyle copyright = TextStyle(
    color: AppColors.lightgrey,
    fontSize: 12,
  );
}
