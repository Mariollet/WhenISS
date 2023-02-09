import "package:flutter/material.dart";
import "package:keole/ui/view/home_view.dart";
import "package:keole/ui/view/security/forgot_password_view.dart";
import "package:keole/ui/view/security/login_view.dart";

class AppRoutes {
  // Security
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";
  // Home
  static const String home = "/home";

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return createPageRoute(const LoginView());
      case AppRoutes.forgotPassword:
        return createPageRoute(const ForgotPasswordView());
      case AppRoutes.home:
        return createPageRoute(const HomeView());
      default:
        return null;
    }
  }

  static MaterialPageRoute createPageRoute(Widget view) =>
      MaterialPageRoute(builder: (_) => view);
}
