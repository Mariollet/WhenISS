import "package:flutter/material.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/splash_view.dart";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        home: const SplashView(),
        onGenerateRoute: Routes.onGenerateRoute,
        title: env["APP_NAME"],
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
