import 'package:fl_starter/services/screen_saver_timer.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final screenSaverTimerProvider =
    StateProvider<ScreenSaverTimer>((_) => ScreenSaverTimer());
