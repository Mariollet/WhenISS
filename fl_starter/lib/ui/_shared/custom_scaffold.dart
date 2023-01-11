import 'package:fl_starter/services/app_colors.dart';
import "package:fl_starter/services/app_images.dart";
import 'package:fl_starter/services/app_routes.dart';
import 'package:fl_starter/services/app_text_styles.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

enum BottomBarType {
  copyright,
  links,
}

class CustomScaffold extends StatelessWidget {
  final EdgeInsets padding;
  final bool verticallyCentered;
  final bool opaqueHeader;
  final bool appBarLogo;
  final bool isModal;
  final BottomBarType? bottomBarType;
  final bool inView;
  final Widget body;

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
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.welcome),
              child: Image.asset(
                AppImages.logo,
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
        // Setting an alignment expands vertically the background image
        alignment: Alignment.topLeft,
        padding: padding,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(AppImages.background),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
            colorFilter: ColorFilter.mode(
              AppColors.black.withOpacity(0.8),
              BlendMode.darken,
            ),
          ),
        ),
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
  Widget build(BuildContext context) => Text(
        "© Keole Flutter Starter",
        style: AppTextStyles.copyright,
      );
}

class _CustomViewLink extends StatelessWidget {
  final bool inView;

  const _CustomViewLink({
    this.inView = false,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(CupertinoIcons.person_crop_circle_fill),
        color: inView ? AppColors.grey[425] : AppColors.white,
        iconSize: 32,
        splashRadius: 20,
        onPressed: () {
          if (inView) return Navigator.of(context).pop();

          Navigator.of(context).pushNamed(AppRoutes.welcome);
        },
      );
}
