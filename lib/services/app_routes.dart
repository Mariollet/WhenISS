import "package:flutter/material.dart";
import "package:keole/ui/view/home_view.dart";
import "package:keole/ui/view/security/login_view.dart";
import "package:keole/ui/view/security/forgot_password_view.dart";

class AppRoutes {
  // Security
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";
  static const String home = "/home";

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return getRoute(const LoginView());
      case AppRoutes.forgotPassword:
        return getRoute(const ForgotPasswordView());
      case AppRoutes.home:
        return getRoute(const HomeView());
      default:
        return null;
    }
  }

  static MaterialPageRoute getRoute(Widget view) =>
      MaterialPageRoute(builder: (_) => view);
}
