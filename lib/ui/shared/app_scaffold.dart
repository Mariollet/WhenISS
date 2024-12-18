import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";
import "package:wheniss/ui/view/map_view.dart";
import "package:wheniss/ui/view/home_view.dart";
import "package:wheniss/ui/view/iss_view.dart";
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

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PersistentTabController controller =
        PersistentTabController(initialIndex: 0);

    return PersistentTabView(context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
        padding: const EdgeInsets.only(top: 8),
        backgroundColor: Colors.grey.shade900,
        isVisible: false,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: NavBarStyle
            .neumorphic // Choose the nav bar style with this property
        );
  }

  List<Widget> _buildScreens() {
    return [HomeView(), MapView(), ISSView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final ScrollController scrollController1 = ScrollController(),
        scrollController2 = ScrollController(),
        scrollController3 = ScrollController();

    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: scrollController1,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/home",
          routes: {
            "/home": (final context) => const HomeView(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/map",
          routes: {
            "/map": (final context) => const MapView(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        scrollController: scrollController3,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/iss",
          routes: {
            "/iss": (final context) => const ISSView(),
          },
        ),
      ),
    ];
  }
}
