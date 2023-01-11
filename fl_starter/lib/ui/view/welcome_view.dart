import 'package:fl_starter/services/app_routes.dart';
import 'package:fl_starter/services/app_text_styles.dart';
import "package:fl_starter/ui/_shared/custom_button.dart";
import "package:fl_starter/ui/_shared/custom_rich_text.dart";
import "package:fl_starter/ui/_shared/custom_scaffold.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WelcomeView extends ConsumerStatefulWidget {
  const WelcomeView({super.key});

  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends ConsumerState<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarLogo: false,
        bottomBarType: BottomBarType.copyright,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 38),
            CustomRichText(
              text: const [
                RichString("Bienvenue sur le Flutter_Starter\n"),
                RichString("KE0lE.NET", bolder: true),
              ],
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 48),
            CustomButton(
              width: 300,
              text: "Connexion",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.welcome);
              },
            ),
          ],
        ));
  }
}
