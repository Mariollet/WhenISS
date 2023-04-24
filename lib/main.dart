import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/app.dart";
import "package:keole/env.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/view_model.dart";

void main() async {
  setupEnvironment();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  final ProviderContainer ref = ProviderContainer();
  final bool isLogged = await ref.read(readTokenProvider.future) != null;

  runApp(
    ProviderScope(
      overrides: [
        isLoggedProvider.overrideWith((_) => isLogged),
      ],
      child: const App(),
    ),
  );
}
