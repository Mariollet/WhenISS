import "package:flutter/material.dart";
import "package:keole/ui/view/view.dart";

abstract class AppRoutes {
  static const String home = '/';
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
  };

  static const List<String> privateRoutes = [home];

  // static final Map<String, Widget Function(BuildContext)> routeBuilders =
  // routes.map((String key, Widget value) => MapEntry(key, (_) => value));

  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, bool isLogged) {
    final String? route = settings.name;
    // final String? finalRoute = onRedirect(route, isLogged);

    // print("Final route: $finalRoute");

    return MaterialPageRoute(
      builder: (_) => routes[login] ?? const NotFoundView(),
      settings: settings,
    );
  }

  /* static String? onRedirect(String? route, bool isLogged) {
    final bool isPrivate = privateRoutes.contains(route);

    print("route: $route - isLogged: $isLogged - isPrivate: $isPrivate");

    // Route is private
    if (isPrivate) {
      // User is logged in, access granted
      if (isLogged) return route;

      return login;
    }

    // Route is /login
    if (route == login) {
      // User is already logged, access denied
      if (isLogged) return home;

      return route;
    }

    return null;
  } */
}
