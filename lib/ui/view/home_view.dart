import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/shared.dart";
import "package:keole/ui/view_model/view_model.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.home,
              style: TextStyles.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              localizations.homeDescription,
              style: TextStyles.p,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, _) => Button(
                width: 300,
                text: localizations.logout,
                onPressed: ([bool mounted = false]) async {
                  await ref.read(logoutProvider.future);

                  if (!mounted) return;

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
                },
              ),
            ),
          ],
        ),
      );
}
