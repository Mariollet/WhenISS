import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_web_plugins/url_strategy.dart";
import "package:keole/app.dart";
import "package:keole/env.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/view_model.dart";

void main() async {
  buildEnvironment();
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  final ProviderContainer ref = ProviderContainer();
  final bool isLogged = await ref.read(isLoggedProvider.future);

  runApp(
    ProviderScope(
      overrides: [
        isLoggedStateProvider.overrideWith((_) => isLogged),
      ],
      child: const App(),
    ),
  );
}
