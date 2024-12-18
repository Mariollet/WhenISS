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
      child: GNav(
          rippleColor:
              Colors.grey[800]!, // tab button ripple color when pressed
          hoverColor: Colors.grey[700]!, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder:
              Border.all(color: Colors.black, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: AppColors.primary, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: AppColors.primary
              .withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ), // navigation bar padding
          tabs: [
            GButton(
              active: false,
              icon: Icons.import_contacts,
              text: 'Home',
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false),
            ),
            GButton(
              active: false,
              icon: Icons.import_contacts,
              text: 'Likes',
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.map),
            ),
            GButton(
              active: tabIndex == 2,
              icon: Icons.import_contacts,
              text: 'Search',
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.iss),
            ),
          ]),
    );
  }
}
