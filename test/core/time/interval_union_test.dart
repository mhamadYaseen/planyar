import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/interval_union.dart';

final t0 = Instant.parse('2026-10-25T00:00:00Z');
InstantRange r(int fromMin, int toMin) => InstantRange(t0 + Duration(minutes: fromMin), t0 + Duration(minutes: toMin));

void main() {
  test('empty input covers nothing', () {
    expect(IntervalUnion.merge(const []), isEmpty);
    expect(IntervalUnion.covered(const []), Duration.zero);
  });

  test('disjoint ranges add up', () {
    expect(IntervalUnion.covered([r(0, 60), r(120, 150)]), const Duration(minutes: 90));
    expect(IntervalUnion.merge([r(120, 150), r(0, 60)]), [r(0, 60), r(120, 150)]);
  });

  test('overlapping and contained ranges are counted once', () {
    expect(IntervalUnion.covered([r(0, 60), r(30, 90)]), const Duration(minutes: 90));
    expect(IntervalUnion.covered([r(0, 120), r(30, 60)]), const Duration(minutes: 120));
    expect(IntervalUnion.merge([r(0, 60), r(30, 90), r(200, 210)]), [r(0, 90), r(200, 210)]);
  });

  test('touching ranges merge without double counting', () {
    expect(IntervalUnion.merge([r(0, 60), r(60, 90)]), [r(0, 90)]);
  });

  test('many small ranges', () {
    final ranges = [for (var i = 0; i < 100; i++) r(i * 10, i * 10 + 15)];
    expect(IntervalUnion.covered(ranges), const Duration(minutes: 1005));
  });

  test('clipping to a window never exceeds the window length', () {
    final day = r(0, 1440);
    final ranges = [r(-120, 60), r(30, 1500), r(2000, 2100)];
    expect(IntervalUnion.covered(ranges, within: day), const Duration(minutes: 1440));
    expect(IntervalUnion.covered([r(-120, 60)], within: day), const Duration(minutes: 60));
    expect(IntervalUnion.covered([r(2000, 2100)], within: day), Duration.zero);
  });
}
