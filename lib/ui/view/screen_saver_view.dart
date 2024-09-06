import "package:fl_starter/ui/view_model/screen_saver_view_model.dart";
import "package:flutter/material.dart";
import "package:fl_starter/services/app_images.dart";
import "package:fl_starter/services/app_text_styles.dart";
import "package:fl_starter/ui/shared/app_scaffold.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ScreenSaverView extends StatelessWidget {
  const ScreenSaverView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: false,
        bottomBar: false,
        isModal: false,
        body: Consumer(
          builder: (final BuildContext context, final WidgetRef ref,
              final Widget? child) {
            final screenSaverTimer = ref.watch(screenSaverTimerProvider);

            return InkWell(
              onTap: () {
                screenSaverTimer.unlock();
                Navigator.pop(context);
              },
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logo),
                    const SizedBox(height: 40),
                    const Text("StudioKG", style: AppTextStyles.h1),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
