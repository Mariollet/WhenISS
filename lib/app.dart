import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";

class App extends StatelessWidget {
  const App({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          initialRoute: initialRoute,
          onGenerateRoute: AppRoutes.onGenerateRoute,
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
          locale: Locale(env["APP_LOCALE"]),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      );
}
