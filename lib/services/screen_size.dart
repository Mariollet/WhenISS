import "package:flutter/material.dart";

enum ScreenSizeType {
  xs(320),
  sm(375),
  md(425),
  lg(768),
  xl(1024),
  xxl(1440);

  const ScreenSizeType(this.size);
  final int size;
}

class ScreenSize {
  static bool xs(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizeType.xs.size;
  }

  static bool sm(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizeType.sm.size;
  }

  static bool md(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizeType.md.size;
  }

  static bool lg(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizeType.lg.size;
  }

  static bool xl(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizeType.xl.size;
  }

  static bool xxl(BuildContext context) {
    return MediaQuery.of(context).size.width > ScreenSizeType.xxl.size;
  }
}
