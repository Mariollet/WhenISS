/* import 'package:keole/ui/_shared/custom_rich_text.dart';
import "package:flutter/material.dart";
import "package:keole/data/repository/login_repository.dart";
import 'package:keole/services/app_images.dart';
import "package:keole/services/app_routes.dart";
import "package:keole/services/app_text_styles.dart";
import "package:keole/ui/_shared/custom_button.dart";
import "package:keole/ui/_shared/custom_scaffold.dart";
import "package:keole/ui/view_model/login_view_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        appBarLogo: false,
        bottomBarType: BottomBarType.copyright,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              height: 140,
            ),
            const SizedBox(height: 180),
            CustomRichText(
              text: const [
                RichString("Bienvenue sur le Fl_Starter\n"),
                RichString("KEOLE.NET", bolder: true),
              ],
              style: AppTextStyles.h2,
            ),
            const SizedBox(height: 180),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final bool hasLoginToken =
                    ref.watch(hasLoginTokenViewModelProvider) ?? false;

                if (hasLoginToken) {
                  return Column(
                    children: [
                      CustomButton(
                        text: "Continuer",
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.welcome),
                      ),
                      child!,
                      CustomButton(
                        text: "Déconnexion",
                        onPressed: () {
                          ref.read(clearSecureStorageRepositoryProvider);

                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.login);
                        },
                      ),
                    ],
                  );
                }

                return CustomButton(
                  text: "Connexion",
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.login),
                );
              },
              child: const SizedBox(height: 20),
            ),
          ],
        ),
      );
}
 */