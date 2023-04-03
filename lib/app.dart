import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/view/start_view.dart";
import "package:keole/ui/view/view.dart";
import "package:keole/ui/view_model/view_model.dart";

/// URL rewrite
/// - page if OK
/// - /login if the page is guarded
/// - /not-found

/// If the page must not have an URL,

// TODO: better routing
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isLogged = ref.watch(isLoggedStateProvider);

    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const StartView(),
      // initialRoute: initialRoute,
      // onGenerateRoute: (RouteSettings settings) =>
      // AppRoutes.onGenerateRoute(settings, isLogged),
      title: env["APP_NAME"],
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
      ),
      locale: Locale(env["APP_LOCALE"]),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
