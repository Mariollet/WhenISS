import "package:flutter/material.dart";

class AppColors {
  static const Color transparent = Color(0x00ffffff);

  static const Color error = Color(0xFFBD2121);

  static const Color white = Color(0xffffffff);

  static const Color black = Color(0xff000000);

  static const int _grey = 0xFF1D1D1F;
  static const MaterialColor grey = MaterialColor(_grey, <int, Color>{
    300: Color(0xFFFFFFFF),
    400: Color(0xFFE2E2E2),
    425: Color(0xFF888888),
    450: Color(0xFF393939),
    500: Color(_grey),
    550: Color(0xff232326),
    600: Color(0xFF121212),
    700: Color(0xff0f0f0f),
  });

  static const int _primary = 0xFF42E3F8;
  static const MaterialColor primary = MaterialColor(_primary, <int, Color>{
    300: Color(0xFFFFFFFF),
    400: Color(0xFF93F2FF),
    500: Color(_primary),
    600: Color(0xFF00C2DB),
    700: Color(0xFF008FA1),
  });
}
