import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:keole/services/services.dart";

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBar,
    required this.bottomBar,
    this.isModal = false,
    this.padding = EdgeInsets.zero,
    this.verticallyCentered = true,
    required this.body,
  });

  final bool appBar, bottomBar, isModal, verticallyCentered;
  final EdgeInsets padding;
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar
            ? AppBar(
                leading: Navigator.canPop(context)
                    ? IconButton(
                        splashRadius: 30,
                        onPressed: Navigator.of(context).pop,
                        icon: isModal
                            ? const Icon(CupertinoIcons.xmark)
                            : const Icon(CupertinoIcons.arrow_turn_down_left),
                      )
                    : null,
                title:
                    const Image(image: AssetImage(AppImages.logo), width: 200),
                elevation: 0,
                backgroundColor: AppColors.transparent,
                foregroundColor: AppColors.black,
                centerTitle: true,
                toolbarHeight: 80,
                leadingWidth: 80,
              )
            : null,
        body: Padding(
          padding: padding,
          child:
              verticallyCentered ? Center(child: body) : SafeArea(child: body),
        ),
        bottomSheet: bottomBar
            ? Container(
                alignment: Alignment.center,
                height: 50,
                child: const Text(
                  "© 2023 Keole",
                  style: AppTextStyles.copyright,
                  textAlign: TextAlign.center,
                ),
              )
            : null,
        extendBodyBehindAppBar: true,
      );
}
