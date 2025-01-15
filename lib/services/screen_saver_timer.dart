import 'dart:async';

import 'package:wheniss/ui/view/screen_saver_view.dart';
import 'package:flutter/material.dart';

class ScreenSaverTimer extends ChangeNotifier {
  Timer? _timer;
  bool alreadyShowed = false;

  void startScreensaverTimer(BuildContext context) {
    const screensaverDuration = Duration(minutes: 1);

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

  void resetScreensaverTimer() {
    _timer?.cancel();
    unlock();
  }

  void lock() {
    alreadyShowed = true;
  }

  void unlock() {
    alreadyShowed = false;
  }
}
