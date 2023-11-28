import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:studiokg/app.dart";
import "package:studiokg/ui/view/index.dart";
import "package:studiokg/ui/view_model/index.dart";
import "package:package_info_plus/package_info_plus.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashView());

  final ProviderContainer ref = ProviderContainer();
  final bool isLogged = await ref.read(readTokenProvider.future);

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
