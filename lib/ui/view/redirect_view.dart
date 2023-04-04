import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/shared.dart";

class RedirectView extends ConsumerWidget {
  const RedirectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future(
      () =>
          Navigator.of(context).pushReplacementNamed(AppRoutes.forgotPassword),
    );

    return const Loader();
  }
}
