import "package:flutter/material.dart";
import "package:keole/ui/view/home_view.dart";
import "package:keole/ui/view/security/forgot_password_view.dart";
import "package:keole/ui/view/security/login_view.dart";

abstract class AppRoutes {
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";
  static const String home = "/home";

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
        builder: (_) => getView(settings.name)!,
      );

  static Widget? getView(String? route) {
    switch (route) {
      case login:
        return const LoginView();
      case forgotPassword:
        return const ForgotPasswordView();
      case home:
        return const HomeView();
      default:
        return null;
    }
  }
}
