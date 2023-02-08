import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:keole/services/app_colors.dart";
import "package:keole/services/app_images.dart";

/// Custom [Scaffold] widget.
class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.isModal = false,
    this.padding = EdgeInsets.zero,
    this.verticallyCentered = true,
    required this.body,
  });

  /// If `true`, a leading cross icon will appear on the app bar.
  final bool isModal;

  /// The padding to apply on the body. Defaults to [EdgeInsets.zero].
  final EdgeInsets padding;

  /// Determines if the body is vertically centered.
  final bool verticallyCentered;

  /// The scaffold content.
  final Widget body;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: !Navigator.canPop(context)
              ? null
              : IconButton(
                  splashRadius: 30,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    isModal
                        ? CupertinoIcons.xmark
                        : CupertinoIcons.arrow_turn_down_left,
                  ),
                ),
          title: const Image(image: AssetImage(AppImages.logo), width: 200),
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
        extendBody: true,
        extendBodyBehindAppBar: true,
      );
}
