import 'package:flutter/material.dart';

class CustomTransitionBuilder extends PageTransitionsBuilder {
  const CustomTransitionBuilder();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

const PageTransitionsTheme customTransitionTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: CustomTransitionBuilder(),
    TargetPlatform.iOS: CustomTransitionBuilder(),
    TargetPlatform.macOS: CustomTransitionBuilder(),
    TargetPlatform.windows: CustomTransitionBuilder(),
    TargetPlatform.linux: CustomTransitionBuilder(),
  },
);
