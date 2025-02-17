import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/env.dart";
import "package:wheniss/services/index.dart";

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) => MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: (final RouteSettings settings) =>
            AppRoutes.onGenerateRoute(settings, ref),
        onGenerateInitialRoutes: (final String? initialRoute) =>
            AppRoutes.onGenerateInitialRoutes(initialRoute, ref),
        title: Environment.appName,
        color: AppColors.primary,
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
          pageTransitionsTheme: customTransitionTheme,
        ),
        locale: const Locale(Environment.appLocale),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      );
}
