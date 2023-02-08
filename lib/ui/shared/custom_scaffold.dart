import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:keole/services/app_colors.dart";
import "package:keole/services/app_images.dart";
import "package:keole/services/app_routes.dart";

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.padding = EdgeInsets.zero,
    this.verticallyCentered = true,
    this.opaqueHeader = false,
    this.appBarLogo = true,
    this.isModal = false,
    required this.body,
  });

  final EdgeInsets padding;
  final bool verticallyCentered;
  final bool opaqueHeader;
  final bool appBarLogo;
  final bool isModal;
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

    return Scaffold(
      // appBar: appBar,
      body: Container(
        padding: padding,
        child: verticallyCentered ? Center(child: body) : SafeArea(child: body),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
