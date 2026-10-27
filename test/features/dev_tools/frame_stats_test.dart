import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/features/dev_tools/domain/services/frame_stats.dart';

void main() {
  test('percentiles and slow frames over 16.7 ms', () {
    final times = [for (var ms = 1; ms <= 100; ms++) Duration(milliseconds: ms)];
    final stats = FrameStats.of(times);
    expect(stats.frames, 100);
    expect(stats.p50, const Duration(milliseconds: 51));
    expect(stats.p90, const Duration(milliseconds: 90));
    expect(stats.p99, const Duration(milliseconds: 99));
    expect(stats.slow, 84); // 17 … 100 ms
    expect(stats.slowPercent, 84);
  });

  test('no frames', () {
    expect(FrameStats.of(const []).frames, 0);
    expect(FrameStats.of(const []).slowPercent, 0);
  });
}
