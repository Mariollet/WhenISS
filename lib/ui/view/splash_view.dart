import "package:flutter/material.dart";
import "package:keole/services/services.dart";

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.black,
          image: DecorationImage(
            image: AssetImage(AppImages.splash),
          ),
        ),
      );
}
