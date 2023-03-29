import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:keole/services/services.dart";

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.isModal = false,
    this.padding = EdgeInsets.zero,
    this.verticallyCentered = true,
    required this.body,
  });

  final bool isModal, verticallyCentered;
  final EdgeInsets padding;
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: !Navigator.canPop(context)
              ? null
              : IconButton(
                  splashRadius: 30,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: isModal
                      ? const Icon(CupertinoIcons.xmark)
                      : const Icon(CupertinoIcons.arrow_turn_down_left),
                ),
          title: const Image(image: AssetImage(Images.logo), width: 200),
          elevation: 0,
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.black,
          centerTitle: true,
          toolbarHeight: 80,
          leadingWidth: 80,
        ),
        body: Padding(
          padding: padding,
          child:
              verticallyCentered ? Center(child: body) : SafeArea(child: body),
        ),
        bottomSheet: Container(
          alignment: Alignment.center,
          height: 50,
          child: const Text("© 2023 Keole", style: TextStyles.copyright),
        ),
        extendBodyBehindAppBar: true,
      );
}
