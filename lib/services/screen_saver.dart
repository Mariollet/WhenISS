import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:studiokg/ui/view/screen_saver_view.dart";
import "package:studiokg/ui/view_model/screen_saver_view_model.dart";

void showScreenSaver(BuildContext context, WidgetRef ref) {
  final timer = ref.watch(timerForScreenSaverProvider.notifier);

  timer.cancel();
  timer.schedule(() {
    Future(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ScreenSaverView(
            ref: ref,
          ),
        ),
      );
    });
  });
}
