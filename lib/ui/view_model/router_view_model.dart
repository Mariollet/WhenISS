import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/login_view_model.dart";

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (_, __) => const HomeView(),
      ),
      GoRoute(
        path: "/login",
        builder: (_, __) => const LoginView(),
      ),
      GoRoute(
        path: "/forgot-password",
        builder: (_, __) => const ForgotPasswordView(),
      ),
    ],
    errorBuilder: (_, __) => const NotFoundView(),
    redirect: (context, state) async {
      final bool isLogged = await ref.read(isLoggedProvider.future);

      if (!isLogged) return "/login";

      return null;
    },
    navigatorKey: navigatorKey,
  ),
);
