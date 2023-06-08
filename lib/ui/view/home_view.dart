import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/models/index.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/shared/index.dart";
import "package:keole/ui/view_model/index.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
        appBar: true,
        bottomBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (_, WidgetRef ref, Widget? child) {
                try {
                  final String? name = ref.watch(userProvider
                      .select((User? user) => user == null ? null : "$user"));

                  if (name == null) {
                    throw Exception(localizations.errorExpiredSession);
                  }

                  return Text(
                    localizations.homeHello(name),
                    style: AppTextStyles.h1,
                    textAlign: TextAlign.center,
                  );
                } on Exception catch (error) {
                  return FormError(error);
                }
              },
              child: const Loader(),
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
                text: localizations.homeLogout,
                onPressed: () => ref.read(logoutProvider.future).then((_) =>
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.login, (_) => false)),
              ),
            ),
          ],
        ),
      );
}
