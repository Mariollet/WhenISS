import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:keole/services/app_colors.dart";
import "package:keole/services/app_images.dart";
import "package:keole/services/app_routes.dart";

enum BottomBarType {
  copyright,
  links,
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.padding = EdgeInsets.zero,
    this.verticallyCentered = true,
    this.opaqueHeader = false,
    this.appBarLogo = true,
    this.isModal = false,
    this.bottomBarType,
    this.inView = false,
    required this.body,
  });

  final EdgeInsets padding;
  final bool verticallyCentered;
  final bool opaqueHeader;
  final bool appBarLogo;
  final bool isModal;
  final BottomBarType? bottomBarType;
  final bool inView;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      leading: !Navigator.canPop(context)
          ? null
          : IconButton(
              icon: Icon(
                isModal
                    ? CupertinoIcons.xmark
                    : CupertinoIcons.arrow_turn_down_left,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
      title: !appBarLogo
          ? null
          : InkWell(
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.home),
              child: Image.asset(
                AppImages.placeholder,
                width: 230,
              ),
            ),
      elevation: 0,
      backgroundColor:
          opaqueHeader ? AppColors.grey.shade600 : AppColors.transparent,
      centerTitle: true,
      toolbarHeight: 100,
      leadingWidth: 100,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );

    final Widget? bottomNavigationBar;

    switch (bottomBarType) {
      case BottomBarType.copyright:
        bottomNavigationBar = const Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
          child: _Copyright(),
        );

        break;
      case BottomBarType.links:
        bottomNavigationBar = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CustomViewLink(inView: inView),
          ],
        );

        break;
      default:
        bottomNavigationBar = null;
    }

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: padding,
        child: verticallyCentered ? Center(child: body) : SafeArea(child: body),
      ),
      bottomNavigationBar: bottomBarType == null
          ? null
          : Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: bottomNavigationBar,
            ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}

class _Copyright extends StatelessWidget {
  const _Copyright();

  @override
  Widget build(BuildContext context) => const Text("© 2023 Keole");
}

class _CustomViewLink extends StatelessWidget {
  const _CustomViewLink({
    this.inView = false,
  });

  final bool inView;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(CupertinoIcons.person_crop_circle_fill),
        color: inView ? AppColors.grey[425] : AppColors.white,
        iconSize: 32,
        splashRadius: 20,
        onPressed: () {
          if (inView) return Navigator.of(context).pop();

          Navigator.of(context).pushNamed(AppRoutes.home);
        },
      );
}
