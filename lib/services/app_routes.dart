import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/login_view_model.dart";

abstract class AppRoutes {
  static const String home = '/';
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";

  static const List<String> publicRoutes = [login, forgotPassword];
  static const List<String> privateRoutes = [home];

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
  };

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    WidgetRef ref,
  ) {
    final bool isLogged = ref.read(isLoggedStateProvider);
    final String? route = settings.name;
    String? finalRoute = route;
    bool rewriteUrl = false;

    print("onGenerateRoute: $route");

    if (!isLogged && privateRoutes.contains(route)) {
      finalRoute = login;
      rewriteUrl = true;
    }

    return createPageRoute(
      finalRoute,
      settings: settings,
      rewriteUrl: rewriteUrl,
    );
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
    String? initialRoute,
    WidgetRef ref,
  ) {
    final bool isLogged = ref.read(isLoggedStateProvider);

    print("onGenerateInitialRoutes: $initialRoute");

    if (!isLogged && initialRoute == forgotPassword) {
      return [createPageRoute(login), createPageRoute(forgotPassword)];
    }

    if (!isLogged && privateRoutes.contains(initialRoute)) {
      return [createPageRoute(login, rewriteUrl: true)];
    }

    return [createPageRoute(initialRoute)];
  }

  static Route<dynamic> createPageRoute(
    String? route, {
    RouteSettings? settings,
    bool rewriteUrl = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => routes[route] ?? const NotFoundView(),
      settings: rewriteUrl
          ? RouteSettings(
              name: route,
              arguments: settings?.arguments,
            )
          : settings,
    );
  }
}
