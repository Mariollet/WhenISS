import 'package:keole/services/app_colors.dart';
import "package:flutter/material.dart";

abstract class AppTextStyles {
  static TextStyle defaultStyle = TextStyle(
    color: AppColors.grey.shade400,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
    fontSize: 20,
  );

  static TextStyle h1 = TextStyle(
    height: 1.56,
    fontSize: 32,
    letterSpacing: .9,
    color: AppColors.grey.shade400,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat",
  );

  static TextStyle h2 = TextStyle(
    height: 1.56,
    fontSize: 28,
    letterSpacing: .7,
    color: AppColors.grey.shade400,
    fontWeight: FontWeight.w400,
    fontFamily: "Montserrat",
  );

  static TextStyle h3 = TextStyle(
    height: 1.56,
    fontSize: 21,
    letterSpacing: .4,
    color: AppColors.grey.shade400,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
  );

  static TextStyle p = TextStyle(
    height: 1.16,
    color: AppColors.grey.shade400,
    fontSize: 18,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
  );

  static const TextStyle error = TextStyle(
    color: AppColors.error,
    fontSize: 14,
    fontFamily: "Montserrat",
  );

  static TextStyle small = TextStyle(
    color: AppColors.grey.shade400,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontFamily: "Montserrat",
  );

  static TextStyle link = TextStyle(
    color: AppColors.grey.shade400,
    fontSize: 13,
    fontWeight: FontWeight.w100,
    letterSpacing: .2,
    fontFamily: "Montserrat",
  );

  static const TextStyle button = TextStyle(
    color: Color(0xff121212),
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: .6,
    fontFamily: "Montserrat",
  );

  static TextStyle selectLabel({Color? color}) => TextStyle(
        color: color,
        fontSize: 17,
        letterSpacing: .4,
        fontFamily: "Montserrat",
      );

  static TextStyle dottedUnderline = TextStyle(
    color: AppColors.transparent,
    fontSize: 13,
    fontWeight: FontWeight.w100,
    letterSpacing: .2,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dotted,
    decorationColor: AppColors.grey.shade400,
    fontFamily: "Montserrat",
  );

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat",
  );

  static const TextStyle bolder = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
  );

  static TextStyle copyright = TextStyle(
    color: AppColors.grey[425],
    fontSize: 12,
    fontFamily: "Montserrat",
  );
}
