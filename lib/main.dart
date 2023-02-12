import "dart:io";
import "package:context_holder/context_holder.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/app_colors.dart";
import "package:keole/services/app_routes.dart";
import "package:keole/ui/view/start_view.dart";

// TODO: RichString widget
// TODO: Select widget

void main() async {
  await dotenv.load(fileName: ".env");
  await dotenv.load(fileName: ".env.local", mergeWith: {...dotenv.env});

  WidgetsFlutterBinding.ensureInitialized();

  initializeOrientations(dotenv.env["APP_ORIENTATION"]!);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (kDebugMode) HttpOverrides.global = DebugHttpOverrides();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: ContextHolder.key,
        home: const StartView(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        title: dotenv.env["APP_NAME"]!,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
          ),
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: "Jost",
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: AppColors.background,
          ),
        ),
        debugShowCheckedModeBanner: false,
      );
}

class DebugHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (_, __, ___) => true;
}

void initializeOrientations(String orientation) async {
  switch (orientation) {
    case "landscape":
      return await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    case "portrait":
      return await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  }
}
