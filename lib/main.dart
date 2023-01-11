import "dart:io";
import "package:context_holder/context_holder.dart";
import "package:fl_starter/services/app_colors.dart";
import "package:fl_starter/services/app_routes.dart";
import "package:fl_starter/ui/view/start_view.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (kDebugMode) HttpOverrides.global = MyHttpOverrides();

  runApp(
    /// This is where the state of our providers will be stored.
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Flutter Starter",
        debugShowCheckedModeBanner: false,
        navigatorKey: ContextHolder.key,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.grey.shade600,
          fontFamily: "Montserrat",
          colorScheme: const ColorScheme.dark(
            primary: AppColors.black,
            secondary: AppColors.grey,
          ),
          unselectedWidgetColor: AppColors.grey[425],
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: const StartView(),
      );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
