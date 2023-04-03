import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/shared.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class StartView extends ConsumerWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(isLoggedProvider).when(
            data: (bool isLogged) {
              ref.read(isLoggedStateProvider.notifier).state = isLogged;

              Future(() => Navigator.of(context).pushReplacementNamed(
                  isLogged ? AppRoutes.home : AppRoutes.login));

              return Text("OK, $isLogged");
            },
            error: (_, __) {
              ref.read(isLoggedStateProvider.notifier).state = false;

              Future(() =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login));

              return const Text("error, not logged");
            },
            loading: () => const Loader(),
          );
}
