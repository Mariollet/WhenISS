import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fl_starter/services/app_images.dart";
import "package:fl_starter/services/app_text_styles.dart";
import "package:fl_starter/ui/shared/app_scaffold.dart";

class ScreenSaverView extends StatelessWidget {
  const ScreenSaverView({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: false,
        bottomBar: false,
        isModal: false,
        inScreenSaverView: true,
        body: InkWell(
          onTap: () {
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
        ),
      );
}
