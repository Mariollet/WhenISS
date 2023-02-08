import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/app_images.dart";
import "package:keole/services/app_routes.dart";
import "package:keole/ui/shared/button.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(AppImages.placeholder)),
            const SizedBox(height: 180),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final bool isLogged = ref.watch(isLoggedProvider);

                if (isLogged) {
                  return Column(
                    children: [
                      Button(
                        width: 300,
                        text: "Continuer",
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.home),
                      ),
                      child!,
                      Button(
                        width: 300,
                        text: "Déconnexion",
                        onPressed: () {
                          ref.read(clearSecureStorageProvider);

                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.login);
                        },
                      ),
                    ],
                  );
                }

                return Button(
                  width: 300,
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
