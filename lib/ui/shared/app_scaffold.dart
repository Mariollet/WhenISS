import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/shared/index.dart";

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBar,
    required this.bottomBar,
    this.isModal = false,
    this.backButton = false,
    this.padding = EdgeInsets.zero,
    required this.body,
  });

  final bool appBar, bottomBar, isModal, backButton;
  final EdgeInsets padding;
  final Widget body;

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
        body: Padding(padding: padding, child: Center(child: body)),
        bottomSheet: bottomBar
            ? Container(
                alignment: Alignment.center,
                height: 50,
                child: const Version(),
              )
            : null,
        extendBodyBehindAppBar: true,
      );
}
