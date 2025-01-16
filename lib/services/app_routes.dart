import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/env.dart";
import "package:wheniss/ui/view/home_view.dart";
import "package:wheniss/ui/view/index.dart";
import "package:wheniss/ui/view/iss_model_view.dart";
import "package:wheniss/ui/view/iss_visibility_view.dart";
import "package:wheniss/ui/view/on_boarding_view.dart";
import "package:wheniss/ui/view_model/index.dart";

abstract class AppRoutes {
  static const String home = '/';
  static const String login = "/login";
  static const String forgotPassword = "/forgotPassword";
  static const String onBoarding = "/onBoarding";
  static const String map = "/map";
  static const String visibility = "/visibility";
  static const String model = "/model";

  static const List<String> publicRoutes = [
    login,
    forgotPassword,
  ];
  static const List<String> privateRoutes = [
    onBoarding,
    home,
    map,
    visibility,
    model,
  ];

  static const Map<String, Widget> routes = {
    home: HomeView(),
    login: LoginView(),
    forgotPassword: ForgotPasswordView(),
    onBoarding: OnBoardingView(),
    map: MapView(),
    visibility: ISSVisibilityView(),
    model: ISSModelView(),
  };

  static Route<dynamic>? onGenerateRoute(
    final RouteSettings settings,
    final WidgetRef ref,
  ) {
    // final bool isLogged = ref.read(isLoggedProvider);
    final String? route = settings.name;
    String? finalRoute = route;
    bool rewriteUrl = false;

    // // If user is not connected and tries to access a private page, redirect to login
    // if (!isLogged && privateRoutes.contains(route)) {
    //   finalRoute = login;
    //   rewriteUrl = true;
    // }

    // // If user is connected and tries to access the login page, redirect to home
    // if (isLogged && route == login) {
    //   finalRoute = home;
    //   rewriteUrl = true;
    // }

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
    // final bool isLogged = ref.read(isLoggedProvider);

    // if (!isLogged && initialRoute == forgotPassword) {
    //   return [
    //     createPageRoute(login, rewriteUrl: true),
    //     // The following rewriteUrl is not required
    //     createPageRoute(forgotPassword, rewriteUrl: true),
    //   ];
    // }

    // if (!isLogged && privateRoutes.contains(initialRoute)) {
    //   return [createPageRoute(login, rewriteUrl: true)];
    // }

    // if (isLogged && publicRoutes.contains(initialRoute)) {
    //   return [createPageRoute(home, rewriteUrl: true)];
    // }

    if (initialRoute != null) {
      return [createPageRoute(Environment.appHome)];
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
