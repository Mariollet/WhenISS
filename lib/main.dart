import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_web_plugins/url_strategy.dart";
import "package:keole/app.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/view/start_view.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/view_model.dart";

void main() async {
  buildEnvironment();
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  // 1. show splash while fetching isLogged
  // 2. when isLogged is fetch check the current URL route and replace it if needed

  // runApp(const SplashView());

  // final ProviderContainer ref = ProviderContainer();
  // const bool isLogged = false;
  // final bool isLogged = await ref.read(isLoggedProvider.future);

  runApp(
    ProviderScope(
      /* overrides: [
        isLoggedStateProvider.overrideWith((_) => isLogged),
      ], */
      child: App(
          // initialRoute: isLogged ? AppRoutes.home : AppRoutes.login,
          ),
    ),
  );
}
