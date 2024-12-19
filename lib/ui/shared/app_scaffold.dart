import "dart:developer";

import "package:google_nav_bar/google_nav_bar.dart";
import "package:wheniss/ui/view_model/screen_saver_view_model.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:wheniss/services/index.dart";
import "package:wheniss/ui/shared/index.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBar,
    this.bottomBar,
    this.isModal = false,
    this.backButton = false,
    this.padding = EdgeInsets.zero,
    required this.body,
  });

  final bool appBar, isModal, backButton;
  final EdgeInsets padding;
  final Widget body;
  final Widget? bottomBar;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: appBar
            ? AppBar(
                leading: backButton
                    ? IconButton(
                        splashRadius: 30,
                        onPressed: Navigator.of(context).pop,
                        icon: isModal
                            ? const Icon(CupertinoIcons.xmark)
                            : const Icon(CupertinoIcons.arrow_turn_down_left),
                      )
                    : null,
                automaticallyImplyLeading: false,
                title: const Image(
                  image: AssetImage(AppImages.logo),
                  width: 200,
                ),
                elevation: 0,
                backgroundColor: AppColors.transparent,
                foregroundColor: AppColors.black,
                centerTitle: true,
                toolbarHeight: 80,
                leadingWidth: 80,
              )
            : null,
        body: Consumer(
          builder: (final BuildContext context, final WidgetRef ref,
              final Widget? child) {
            final screenSaverTimer = ref.watch(screenSaverTimerProvider);

            screenSaverTimer.startScreensaverTimer(context);

            return Padding(
              padding: padding,
              child: Center(child: body),
            );
          },
        ),
        bottomSheet: bottomBar,
        extendBodyBehindAppBar: true,
      );
}

class VersionBottomBar extends StatelessWidget {
  const VersionBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: const Version(),
    );
  }
}

class NavBottomBar extends StatelessWidget {
  const NavBottomBar({
    super.key,
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    inspect(tabIndex);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: AppColors.black.withOpacity(0.9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              key: const Key('map'),
              icon: Icon(
                Icons.map_outlined,
                color: tabIndex == 0 ? AppColors.primary : Colors.grey[800],
              ),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.map),
            ),
            IconButton(
              key: const Key('iss'),
              icon: Icon(
                Icons.shape_line_sharp,
                color: tabIndex == 1 ? AppColors.primary : Colors.grey[800],
              ),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.iss),
            ),
          ],
        ),
      ),
    );
  }
}
