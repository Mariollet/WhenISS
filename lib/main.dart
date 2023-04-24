import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:jwt_decoder/jwt_decoder.dart";
import "package:keole/app.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/view_model.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  final ProviderContainer ref = ProviderContainer();
  final String? jwt = await ref.read(readTokenProvider.future);
  bool isLogged;

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

  runApp(
    ProviderScope(
      overrides: [
        isLoggedProvider.overrideWith((_) => isLogged),
      ],
      child: const App(),
    ),
  );
}
