import "dart:io";
import "package:context_holder/context_holder.dart";
import "package:keole/services/app_colors.dart";
import "package:keole/services/app_routes.dart";
// import "package:keole/ui/view/start_view.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";

// TODO: API rework
// TODO: repository rework

void main() async {
  await dotenv.load(fileName: ".env");

  print(dotenv.env["APP_NAME"]);

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (kDebugMode) HttpOverrides.global = DebugHttpOverrides();

  /* runApp(
    /// This is where the state of our providers will be stored.
    const ProviderScope(
      child: App(),
    ),
  ); */
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: ContextHolder.key,
        // home: const StartView(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        title: "Keole", // TODO: move to .env
        theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: AppColors.black,
            secondary: AppColors.grey,
          ),
          scaffoldBackgroundColor: AppColors.grey.shade600,
          unselectedWidgetColor: AppColors.grey[425],
          fontFamily: "Montserrat",
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
