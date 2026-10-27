import 'dart:async';

import 'package:clock/clock.dart';

import 'instant.dart';

/// Emits at every minute boundary (now-line, open-entry tails, midnight).
/// An interface so tests can drive time by hand.
abstract interface class MinuteTicker {
  Stream<Instant> ticks();
}

final class ClockMinuteTicker implements MinuteTicker {
  const ClockMinuteTicker();

  @override
  Stream<Instant> ticks() {
    Timer? timer;
    late StreamController<Instant> controller;
    void scheduleNext() {
      final ms = clock.now().millisecondsSinceEpoch;
      final wait = Duration.millisecondsPerMinute - ms % Duration.millisecondsPerMinute;
      timer = Timer(Duration(milliseconds: wait), () {
        controller.add(Instant.now());
        scheduleNext();
      });
    }

    controller = StreamController<Instant>(onListen: scheduleNext, onCancel: () => timer?.cancel());
    return controller.stream;
  }
}
