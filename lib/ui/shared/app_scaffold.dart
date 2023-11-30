import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fl_starter/services/index.dart";
import "package:fl_starter/services/screen_saver.dart";
import "package:fl_starter/ui/shared/custom_button.dart";
import "package:fl_starter/ui/shared/custom_rich_text.dart";
import "package:fl_starter/ui/shared/index.dart";

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({
    super.key,
    required this.appBar,
    required this.bottomBar,
    this.isModal = false,
    this.backButton = false,
    this.padding = EdgeInsets.zero,
    this.inScreenSaverView = false,
    required this.body,
  });

  final bool appBar, bottomBar, isModal, backButton, inScreenSaverView;
  final EdgeInsets padding;
  final Widget body;

  @override
  CustomScaffoldState createState() => CustomScaffoldState();
}

class CustomScaffoldState extends ConsumerState<AppScaffold>
    with SingleTickerProviderStateMixin {
  bool showWarning = false;
  late AnimationController animationController;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    offset = Tween<Offset>(
      begin: const Offset(0, 100),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutCirc,
    ));
  }

  @override
  Widget build(final BuildContext context) {
    showWarning ? animationController.forward() : animationController.reverse();

    if (!widget.inScreenSaverView) {
      Future(() {
        showScreenSaver(context, ref);
      });
    }

    return Scaffold(
      appBar: widget.appBar
          ? AppBar(
              leading: widget.backButton
                  ? IconButton(
                      splashRadius: 30,
                      onPressed: Navigator.of(context).pop,
                      icon: widget.isModal
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
      body: Stack(
        children: [
          Padding(
            padding: widget.padding,
            child: Center(child: widget.body),
          ),
          // TODO: Check how to trigger the modal from the view
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: offset,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(bottom: 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomRichText(
                          text: [
                            RichString(
                              "Choisissez le mode de réception :",
                              bold: true,
                            ),
                          ],
                          style: AppTextStyles.p,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 36),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: "Email",
                                onPressed: () {
                                  showWarning = false;
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomButton(
                                text: "Sms",
                                onPressed: () {
                                  showWarning = false;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      splashRadius: 20,
                      icon: const Icon(CupertinoIcons.xmark),
                      onPressed: () => setState(() => showWarning = false),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: widget.bottomBar
          ? Container(
              alignment: Alignment.center,
              height: 50,
              child: const Version(),
            )
          : null,
      extendBodyBehindAppBar: true,
    );
  }
}
