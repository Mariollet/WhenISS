import 'package:keole/ui/view/security/login_view.dart';
import 'package:keole/ui/view/security/reset_password_view.dart';
import 'package:keole/ui/view/welcome_view.dart';
import "package:flutter/material.dart";

class AppRoutes {
  // Security Routes
  static const String login = "/login";
  static const String resetPassword = "/reset-password";
  static const String welcome = "/welcome";

  static Route? onGenerateRoute(settings) {
    Widget? screen;

    switch (settings.name) {
      /* case AppRoutes.login:
        screen = const LoginView();
        break;
      case AppRoutes.resetPassword:
        screen = const ResetPasswordView();
        break;
      case AppRoutes.welcome:
        screen = const WelcomeView();
        break; */
    }

    if (screen == null) return null;

    return MaterialPageRoute(builder: (_) => screen!);
  }
}
