import "package:wheniss/env.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:wheniss/services/app_colors.dart";
import "package:wheniss/services/app_images.dart";
import "package:wheniss/services/app_routes.dart";
import "package:wheniss/services/app_text_styles.dart";
import "package:wheniss/ui/shared/app_scaffold.dart";
import "package:wheniss/ui/shared/button.dart";
import "package:wheniss/ui/shared/loader.dart";

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int step = 1;

// focus node to capture keyboard events
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    const List<String> stepperTexts = [
      "Retrouvez la position actuelle de l'ISS en temps réel sur une carte interactive.",
      "Recevez des notifications lorsque l'ISS est visible depuis votre position.",
      "Visualisez la station spatiale internationale en 3D depuis votre canapé !",
    ];
    const List<List<String>> stepperTitles = [
      ["Map", "Localisation de l'ISS"],
      ["Visibilité", "Notifications sur l'ISS"],
      ["Model", "Visualisation de l'ISS"],
    ];
    const List<IconData> stepperIcons = [
      Icons.map_outlined,
      Icons.watch_later_outlined,
      Icons.shape_line_sharp,
    ];

    if (step > 3 || Environment.appDebug == true) {
      Future(() => Navigator.pushNamed(context, AppRoutes.visibility));
      return const Loader();
    }

    return AppScaffold(
      appBar: false,
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.enter) {
            setState(() => step++);
          }
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Image(
                image: AssetImage(AppImages.logoIss),
                width: 126,
                filterQuality: FilterQuality.high,
                isAntiAlias: true,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          stepperIcons[step - 1],
                          color: AppColors.primary,
                          size: 64,
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stepperTitles[step - 1][0].toUpperCase(),
                              style: AppTextStyles.h1,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              stepperTitles[step - 1][1].toUpperCase(),
                              style: AppTextStyles.p.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 120,
                      child: Scrollbar(
                        thumbVisibility: true,
                        thickness: 10,
                        radius: const Radius.circular(0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              stepperTexts[step - 1],
                              style: AppTextStyles.p,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Button(
                text: "SUIVANT",
                onPressed: () => {setState(() => step++)},
                size: ButtonSize.m,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 1; i <= 3; i++)
                      InkWell(
                        onTap: () => setState(() => step = i),
                        child: Container(
                          width: 40,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1),
                            color: step == i
                                ? AppColors.primary
                                : AppColors.ligthPrimary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
