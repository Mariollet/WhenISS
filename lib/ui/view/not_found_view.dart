import "package:flutter/material.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/shared/index.dart";

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
        appBar: false,
        bottomBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("404", style: AppTextStyles.notFoundTitle),
            Text(
              localizations.notFoundDescription,
              style: AppTextStyles.notFoundDescription,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
