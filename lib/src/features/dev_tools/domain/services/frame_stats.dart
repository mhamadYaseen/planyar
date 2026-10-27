/// Summary of recorded frame times (Phase 1 DoD: "scrolls at 60 fps").
final class FrameStats {
  const FrameStats({required this.frames, required this.p50, required this.p90, required this.p99, required this.slow});

  /// [frameTimes] are vsync-to-raster-finish durations; a frame is slow when
  /// it takes longer than one 60 Hz frame (16.7 ms).
  factory FrameStats.of(List<Duration> frameTimes) {
    if (frameTimes.isEmpty) {
      return const FrameStats(frames: 0, p50: Duration.zero, p90: Duration.zero, p99: Duration.zero, slow: 0);
    }
    final sorted = [...frameTimes]..sort();
    Duration at(double q) => sorted[((sorted.length - 1) * q).round()];
    return FrameStats(
      frames: sorted.length,
      p50: at(0.5),
      p90: at(0.9),
      p99: at(0.99),
      slow: sorted.where((d) => d > budget).length,
    );
  }

  static const budget = Duration(microseconds: 16667);

  final int frames;
  final Duration p50;
  final Duration p90;
  final Duration p99;
  final int slow;

  double get slowPercent => frames == 0 ? 0 : slow * 100 / frames;
}
