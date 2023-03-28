import "package:flutter/material.dart";
import "package:keole/app.dart";
import "package:keole/env.dart";
import "package:keole/ui/splash_view.dart";

void main() async {
  setupEnvironment();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  await Future.delayed(const Duration(seconds: 1));

  runApp(const App());
}
