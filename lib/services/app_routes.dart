import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/ui/view/home_view.dart";
import "package:wheniss/ui/view/index.dart";
import "package:wheniss/ui/view/iss_view.dart";
import "package:wheniss/ui/view_model/index.dart";

abstract class AppRoutes {
  static const String home = '/';
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";
  static const String map = "/map";
  static const String iss = "/iss";

  static const List<String> publicRoutes = [
    login,
    forgotPassword,
  ];
  static const List<String> privateRoutes = [
    home,
    map,
    iss,
  ];

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
    map: MapView(),
    iss: ISSView(),
  };

  static Route<dynamic>? onGenerateRoute(
    final RouteSettings settings,
    final WidgetRef ref,
  ) {
    final bool isLogged = ref.read(isLoggedProvider);
    final String? route = settings.name;
    String? finalRoute = route;
    bool rewriteUrl = false;

    // If user is not connected and tries to access a private page, redirect to login
    if (!isLogged && privateRoutes.contains(route)) {
      finalRoute = login;
      rewriteUrl = true;
    }

    // If user is connected and tries to access the login page, redirect to home
    if (isLogged && route == login) {
      finalRoute = home;
      rewriteUrl = true;
    }

    return createPageRoute(
      finalRoute,
      settings: settings,
      rewriteUrl: rewriteUrl,
    );
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
    final String? initialRoute,
    final WidgetRef ref,
  ) {
    final bool isLogged = ref.read(isLoggedProvider);

    if (!isLogged && initialRoute == forgotPassword) {
      return [
        createPageRoute(login, rewriteUrl: true),
        // The following rewriteUrl is not required
        createPageRoute(forgotPassword, rewriteUrl: true),
      ];
    }

    if (!isLogged && privateRoutes.contains(initialRoute)) {
      return [createPageRoute(login, rewriteUrl: true)];
    }

    if (isLogged && publicRoutes.contains(initialRoute)) {
      return [createPageRoute(home, rewriteUrl: true)];
    }

    return [createPageRoute(initialRoute)];
  }

  static Route<dynamic> createPageRoute(
    final String? route, {
    final RouteSettings? settings,
    final bool rewriteUrl = false,
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
