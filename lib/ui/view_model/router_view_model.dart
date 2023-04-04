import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/login_view_model.dart";
// TODO: remove alias
import "package:keole/services/services.dart" as services;

final routerProvider = Provider<Router<Object>>(
  (ref) => Router(routerDelegate: AppRouterDelegate(ref)),
);

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with PopNavigatorRouterDelegateMixin<AppRoute>, ChangeNotifier {
  final Ref ref;
  @override
  final GlobalKey<NavigatorState> navigatorKey = services.navigatorKey;

  AppRouterDelegate(this.ref);

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async => Future<void>;

  @override
  Widget build(BuildContext context) {
    final bool isLogged = ref.watch(isLoggedStateProvider);

    return Navigator(
      pages: [
        MaterialPage(
          child: isLogged ? const HomeView() : const LoginView(),
          key: ValueKey(isLogged ? "home" : "login"),
        ),
      ],
      onPopPage: (Route<dynamic> route, dynamic result) => route.didPop(result),
    );
  }
}

class AppRoute {}
