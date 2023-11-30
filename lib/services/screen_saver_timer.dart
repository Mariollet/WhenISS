import 'dart:async';

import 'package:fl_starter/ui/view/screen_saver_view.dart';
import 'package:flutter/material.dart';

class ScreenSaverTimer extends ChangeNotifier {
  Timer? _timer;
  bool alreadyShowed = false;

  void startScreensaverTimer(BuildContext context) {
    const screensaverDuration = Duration(seconds: 3);

    if (alreadyShowed) {
      return;
    }

    _timer?.cancel();

    _timer = Timer(screensaverDuration, () {
      if (!alreadyShowed) {
        lock();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScreenSaverView()),
        );
      }
    });
  }

  void lock() {
    alreadyShowed = true;
  }

  void unlock() {
    alreadyShowed = false;
  }
}
