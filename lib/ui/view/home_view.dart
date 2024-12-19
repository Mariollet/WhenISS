import "package:wheniss/services/app_colors.dart";
import "package:wheniss/ui/shared/app_scaffold.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppScaffold(
      appBar: true,
      // bottomBar: NavBottomBar(tabIndex: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (_, final WidgetRef ref, final Widget? child) {
              return Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Home View",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  NavBottomBar(tabIndex: 0)
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
