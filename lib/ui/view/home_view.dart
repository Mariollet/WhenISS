import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/app_routes.dart";
import "package:keole/ui/shared/button.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) => CustomScaffold(
        appBarLogo: false,
        bottomBarType: BottomBarType.copyright,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* const SizedBox(height: 38),
            const CustomRichText(
              text: const [
                RichString("Bienvenue sur le Flutter_Starter\n"),
                RichString("Keole", bolder: true),
              ],
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 48), */
            Button(
              text: "Déconnexion",
              onPressed: () {
                ref.read(clearSecureStorageProvider);

                Navigator.of(context).pushReplacementNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      );
}
