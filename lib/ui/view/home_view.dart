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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              width: 300,
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
