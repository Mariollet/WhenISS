import "package:flutter/material.dart";
import "package:keole/ui/view/home_view.dart";
import "package:keole/ui/view/splash_view.dart";
import "package:keole/ui/view/security/forgot_password_view.dart";
import "package:keole/ui/view/security/login_view.dart";

abstract class AppRoutes {
  static const String home = "/",
      login = "/login",
      forgotPassword = "/forgot-password";

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
  };

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
          builder: (_) => routes[settings.name] ?? const SplashView());
}
