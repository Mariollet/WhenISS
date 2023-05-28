import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jwt_decoder/jwt_decoder.dart";
import "package:keole/app.dart";
import "package:keole/ui/view/view.dart";
import 'package:keole/ui/view_model/package_view_model.dart';
import "package:keole/ui/view_model/view_model.dart";
import "package:package_info_plus/package_info_plus.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  final ProviderContainer ref = ProviderContainer();
  final String? jwt = await ref.read(readTokenProvider.future);
  bool isLogged;

  // TODO: move JWT logic
  if (jwt != null) {
    try {
      isLogged = !JwtDecoder.isExpired(jwt);
    } on FormatException catch (_) {
      isLogged = false;
    }

    if (!isLogged) await ref.read(logoutProvider.future);
  } else {
    isLogged = false;
  }

  final PackageInfo package = await PackageInfo.fromPlatform();

  runApp(
    ProviderScope(
      overrides: [
        isLoggedProvider.overrideWith((_) => isLogged),
        packageProvider.overrideWith((_) => package),
      ],
      child: const App(),
    ),
  );
}
