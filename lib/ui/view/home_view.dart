import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/shared.dart";
import "package:keole/ui/view_model/view_model.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: true,
        bottomBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localizations.homeHello("Julien"),
              style: AppTextStyles.h1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              localizations.homeDescription,
              style: AppTextStyles.p,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, _) => Button(
                size: ButtonSize.m,
                text: localizations.logout,
                onPressed: () => ref.read(logoutProvider.future).then((_) =>
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.login, (_) => false)),
              ),
            ),
          ],
        ),
      );
}
