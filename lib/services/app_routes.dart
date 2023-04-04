import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/login_view_model.dart";

abstract class AppRoutes {
  static const String home = '/';
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
  };

  static const List<String> publicRoutes = [login, forgotPassword];
  static const List<String> privateRoutes = [home];

  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, WidgetRef ref, bool isLogged) {
    final String? route = settings.name;
    String? finalRoute = route;
    bool shouldReplace = false;

    print("onGenerate: $route");

    if (!isLogged && privateRoutes.contains(route)) {
      finalRoute = login;
      shouldReplace = true;
    }

    return createPageRoute(finalRoute,
        settings: settings, shouldReplace: shouldReplace);
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
      String? initialRoute, WidgetRef ref) {
    // if (initialRoute == forgotPassword) print("YES");
    final bool isLogged = ref.read(isLoggedStateProvider);

    return [
      if (!isLogged) createPageRoute(home),
      if (!isLogged) createPageRoute(login),
      if (!isLogged && initialRoute == forgotPassword)
        createPageRoute(forgotPassword),
    ];
  }

  static Route<dynamic> createPageRoute(
    String? route, {
    RouteSettings? settings,
    bool shouldReplace = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => routes[route] ?? const NotFoundView(),
      settings: shouldReplace
          ? RouteSettings(
              name: route,
              arguments: settings!.arguments,
            )
          : settings,
    );
  }
}
