import "package:flutter/material.dart";
import "package:keole/app.dart";
import "package:keole/env.dart";
import "package:keole/ui/view/splash_view.dart";

void main() async {
  setupEnvironment();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());
  runApp(const App());
}
