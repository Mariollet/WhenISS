import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final bool isLogged = ref.watch(isLoggedProvider);

            Future(() => Navigator.of(context)
                .pushReplacementNamed(isLogged ? Routes.home : Routes.login));

            return child!;
          },
          child: const SizedBox(),
        ),
      );
}
