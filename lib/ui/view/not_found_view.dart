import "package:flutter/material.dart";
import "package:wheniss/services/index.dart";
import "package:wheniss/ui/shared/index.dart";

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(final BuildContext context) => AppScaffold(
        appBar: false,
        bottomBar: VersionBottomBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "404",
              style: AppTextStyles.notFoundTitle,
              textAlign: TextAlign.center,
            ),
            Text(
              localizations.notFoundDescription,
              style: AppTextStyles.notFoundDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Link(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.home),
              child: Text(
                localizations.notFoundReturn,
                style: AppTextStyles.link,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
