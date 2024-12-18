import "package:flutter/material.dart";
import "package:wheniss/services/index.dart";

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(final BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(image: AssetImage(AppImages.icon)),
        ),
      );
}
