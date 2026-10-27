import 'package:flutter/scheduler.dart';

import '../domain/services/frame_stats.dart';

/// Records Flutter frame timings while the user scrolls elsewhere in the
/// app (works in release builds too). Dev flavor only; app-wide singleton
/// so recording survives navigation.
class FrameTimingRecorder {
  final _times = <Duration>[];
  bool _recording = false;

  bool get isRecording => _recording;

  void start() {
    if (_recording) return;
    _times.clear();
    _recording = true;
    SchedulerBinding.instance.addTimingsCallback(_onTimings);
  }

  FrameStats stop() {
    if (_recording) SchedulerBinding.instance.removeTimingsCallback(_onTimings);
    _recording = false;
    return FrameStats.of(_times);
  }

  void _onTimings(List<FrameTiming> timings) {
    for (final timing in timings) {
      _times.add(timing.totalSpan);
    }
  }
}
