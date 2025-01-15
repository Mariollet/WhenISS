import "dart:developer";

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
    this.tabIndex,
  });

  final bool appBar, isModal, backButton;
  final EdgeInsets padding;
  final Widget body;
  final Widget? bottomBar;
  final int? tabIndex;

  @override
  Widget build(final BuildContext context) => SafeArea(
        child: Scaffold(
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
                    image: AssetImage(AppImages.logoIss),
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

              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: Padding(
                      padding: padding,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            screenSaverTimer.startScreensaverTimer(context);
                          },
                          onPanDown: (_) {
                            screenSaverTimer.startScreensaverTimer(context);
                          },
                          onScaleStart: (_) {
                            screenSaverTimer.startScreensaverTimer(context);
                          },
                            child: body),
                      ),
                    ),
                  ),
                  NavBottomBar(tabIndex: tabIndex),
                ],
              );
            },
          ),
          bottomSheet: bottomBar,
          extendBodyBehindAppBar: true,
        ),
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
    this.tabIndex,
  });

  final int? tabIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: AppColors.black.withOpacity(0.9)),
        padding: const EdgeInsets.symmetric(horizontal: 62),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              key: const Key('visibility'),
              icon: Icon(
                Icons.watch_later_outlined,
                color: tabIndex == 0 ? AppColors.primary : Colors.grey[600],
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.visibility),
            ),
            IconButton(
              key: const Key('map'),
              icon: Icon(
                Icons.map_outlined,
                color: tabIndex == 1 ? AppColors.primary : Colors.grey[600],
              ),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.map),
            ),
            IconButton(
              key: const Key('iss'),
              icon: Icon(
                Icons.shape_line_sharp,
                color: tabIndex == 2 ? AppColors.primary : Colors.grey[600],
              ),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.model),
            ),
          ],
        ),
      ),
    );
  }
}
