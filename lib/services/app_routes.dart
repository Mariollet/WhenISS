import "package:flutter/material.dart";
import "package:keole/ui/view/home_view.dart";
import "package:keole/ui/view/security/login_view.dart";
import "package:keole/ui/view/security/forgot_password_view.dart";

class AppRoutes {
  // Security Routes
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";
  static const String home = "/home";

  static Route? onGenerateRoute(RouteSettings settings) {
    Widget? screen;

    switch (settings.name) {
      case AppRoutes.login:
        screen = const LoginView();
        break;
      case AppRoutes.forgotPassword:
        screen = const ForgotPasswordView();
        break;
      case AppRoutes.home:
        screen = const HomeView();
        break;
    }

    if (screen == null) return null;

    return MaterialPageRoute(builder: (_) => screen!);
  }
}
