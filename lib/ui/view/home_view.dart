import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/button.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Accueil",
              style: TextStyles.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              "Vous êtes actuellement connecté(e).",
              style: TextStyles.p,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, _) => Button(
                width: 300,
                text: "Se déconnecter",
                onPressed: () {
                  ref.read(clearSecureStorageProvider);

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Routes.login, (_) => false);
                },
              ),
            ),
          ],
        ),
      );
}
