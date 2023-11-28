// ignore: depend_on_referenced_packages
import 'package:async/async.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final timerForScreenSaverProvider =
    StateNotifierProvider<TimerForScreenSaverNotifier, RestartableTimer>(
  (_) => TimerForScreenSaverNotifier(),
);

class TimerForScreenSaverNotifier extends StateNotifier<RestartableTimer> {
  TimerForScreenSaverNotifier() : super(RestartableTimer(Duration.zero, () {}));

  void cancel() => state.cancel();

  void schedule(final void Function() callback) =>
      state = RestartableTimer(const Duration(minutes: 1), callback);
}
