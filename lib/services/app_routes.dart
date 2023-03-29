import "package:flutter/material.dart";
import "package:keole/ui/view/view.dart";

abstract class AppRoutes {
  static const String home = "/";
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
  };

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
          builder: (_) => routes[settings.name] ?? const SplashView());
}
