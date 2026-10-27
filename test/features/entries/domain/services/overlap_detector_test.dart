// OverlapDetector (plan §6.6, §11.2, J5). Times are Baghdad local (+03:00).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/services/overlap_detector.dart';

import '../../../../helpers/entry_factory.dart';

String at(String hhmm) => '2026-10-25T$hhmm:00+03:00';
Entry e(String id, String from, String? to, {EntryKind kind = EntryKind.actual}) =>
    makeEntry(id, kind: kind, start: at(from), end: to == null ? null : at(to));
InstantRange r(String from, String to) => InstantRange(Instant.parse(at(from)), Instant.parse(at(to)));

void main() {
  const detector = OverlapDetector();
  List<List<String>> ids(List<List<Entry>> clusters) => [for (final c in clusters) c.map((x) => x.id).toList()];

  test('no overlap', () {
    expect(detector.clusters([e('a', '09:00', '10:00'), e('b', '11:00', '12:00')]), isEmpty);
  });

  test('touching entries do not overlap (J5 AC4)', () {
    expect(detector.clusters([e('a', '14:00', '15:00'), e('b', '15:00', '16:00')]), isEmpty);
  });

  test('simple, nested and identical overlaps', () {
    expect(ids(detector.clusters([e('work', '14:00', '17:00'), e('call', '15:00', '16:00')])), [
      ['work', 'call'],
    ]);
    expect(ids(detector.clusters([e('a', '10:00', '11:00'), e('b', '10:00', '11:00')])), [
      ['a', 'b'],
    ]);
  });

  test('a chain of three is one cluster', () {
    final entries = [e('a', '09:00', '10:30'), e('b', '10:00', '11:30'), e('c', '11:00', '12:00')];
    expect(ids(detector.clusters(entries)), [
      ['a', 'b', 'c'],
    ]);
    expect(detector.overlappingIds(entries), {'a', 'b', 'c'});
  });

  test('open entries are ignored until they have an end', () {
    expect(detector.clusters([e('open', '14:00', null), e('work', '13:00', '17:00')]), isEmpty);
  });

  test('planned never overlaps actual (J5 AC3); planned-planned does', () {
    final entries = [
      e('plan', '14:00', '17:00', kind: EntryKind.planned),
      e('act', '15:00', '16:00'),
      e('plan2', '16:00', '18:00', kind: EntryKind.planned),
    ];
    expect(ids(detector.clusters(entries)), [
      ['plan', 'plan2'],
    ]);
  });

  test('editor check lists same-kind overlaps, sorted, excluding the entry being edited (J5 AC1)', () {
    final existing = [
      e('work', '14:00', '17:00'),
      e('lunch', '12:00', '15:30'),
      e('plan', '15:00', '16:00', kind: EntryKind.planned),
      e('self', '15:00', '16:00'),
      e('open', '15:10', null),
    ];
    final found = detector.overlapping(
      kind: EntryKind.actual,
      range: r('15:00', '16:00'),
      among: existing,
      excludeId: 'self',
    );
    expect(found.map((x) => x.id), ['lunch', 'work']);
  });

  test('clusters are stable: same input in any order gives the same result', () {
    final entries = [
      e('c', '11:00', '12:00'),
      e('a', '09:00', '10:30'),
      e('b', '10:00', '11:30'),
      e('d', '09:00', '10:30'),
    ];
    final first = ids(detector.clusters(entries));
    expect(ids(detector.clusters(entries.reversed)), first);
    expect(first, [
      ['a', 'd', 'b', 'c'],
    ]);
  });

  test('clipping: overlap only on another day is not reported for this day', () {
    final day = InstantRange(Instant.parse(at('00:00')), Instant.parse('2026-10-26T00:00:00+03:00'));
    final a = makeEntry('a', start: '2026-10-25T23:00:00+03:00', end: '2026-10-26T07:00:00+03:00');
    final b = makeEntry('b', start: '2026-10-26T06:00:00+03:00', end: '2026-10-26T08:00:00+03:00');
    expect(detector.overlappingIds([a, b], within: day), isEmpty);
    expect(detector.overlappingIds([a, b]), {'a', 'b'});
  });
}
