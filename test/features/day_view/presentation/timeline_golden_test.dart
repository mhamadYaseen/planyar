// Timeline goldens (Phase 1 DoD, plan §11.5): overnight, overlap, open
// entry and a DST day, in light/dark at 1.0× and 2.0× text.
// Update: flutter test --update-goldens --tags golden
@Tags(['golden'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/core/widgets/time_scope.dart';
import 'package:planyar/src/features/day_view/domain/entities/day_layout.dart';
import 'package:planyar/src/features/day_view/domain/services/day_summary.dart';
import 'package:planyar/src/features/day_view/domain/services/timeline_layout.dart';
import 'package:planyar/src/features/day_view/presentation/bloc/day_view_bloc.dart';
import 'package:planyar/src/features/day_view/presentation/widgets/day_timeline.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/labels/domain/entities/label.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/entry_factory.dart';
import '../../../helpers/golden.dart';

final t0 = Instant.parse('2026-10-01T00:00:00Z');
Label label(String id, String name, String color, {String? icon}) => Label(
  id: id,
  name: name,
  nameKey: name.toLowerCase(),
  colorKey: color,
  iconKey: icon,
  createdAt: t0,
  updatedAt: t0,
);

final labels = {
  for (final l in [
    label('sleep', 'Sleep', 'indigo', icon: 'sleep'),
    label('work', 'Work', 'blue', icon: 'work'),
    label('call', 'Call', 'rose', icon: 'call'),
    label('study', 'Study', 'teal', icon: 'study'),
    label('gym', 'Exercise', 'green', icon: 'exercise'),
  ])
    l.id: l,
};

void main() {
  late TimeZoneService zones;
  late TimeZoneService newYork;

  setUpAll(() async {
    tzdata.initializeTimeZones();
    zones = TimeZoneService(() async => 'Asia/Baghdad');
    await zones.refresh();
    // Must be awaited: before refresh() completes, the service falls back to
    // the machine's own zone (that bug made CI and local goldens differ).
    newYork = TimeZoneService(() async => 'America/New_York');
    await newYork.refresh();
  });

  Widget timeline(
    TimeZoneService z,
    LocalDate date,
    List<Entry> entries, {
    String now = '2026-10-25T14:20:00+03:00',
    LaneMode lanes = LaneMode.split,
  }) {
    final layout = TimelineLayout(z.dayMath)
        .build(date: date, entries: entries, now: Instant.parse(now), laneMode: lanes);
    final view = DayView(
      layout: layout,
      summary: DaySummary.of(day: layout.bounds, entries: entries),
      labels: labels,
    );
    return TimeScope(
      timeZones: z,
      child: DayTimeline(view: view, laneMode: lanes, onEntryTap: (_) {}, onSetEnd: (_) {}, onGapTap: (_, _) {}),
    );
  }

  Entry e(String id, String label, String from, String? to, {EntryKind kind = EntryKind.actual}) =>
      makeEntry(id, labelId: label, kind: kind, start: '$from+03:00', end: to == null ? null : '$to+03:00');

  goldenTest(
    'overnight, overlap and open entry (Sun 25 Oct)',
    fileName: 'timeline_sunday',
    surfaceSize: const Size(400, 1000),
    builder: (_) => timeline(zones, LocalDate(2026, 10, 25), [
      e('sleep', 'sleep', '2026-10-24T23:10:00', '2026-10-25T06:50:00'),
      e('plan-sleep', 'sleep', '2026-10-24T23:00:00', '2026-10-25T07:00:00', kind: EntryKind.planned),
      e('work', 'work', '2026-10-25T09:00:00', '2026-10-25T12:00:00'),
      e('call', 'call', '2026-10-25T10:00:00', '2026-10-25T11:00:00'),
      e('plan-work', 'work', '2026-10-25T09:00:00', '2026-10-25T17:00:00', kind: EntryKind.planned),
      e('study', 'study', '2026-10-25T13:05:00', null),
      e('gym', 'gym', '2026-10-25T23:00:00', '2026-10-26T00:30:00'),
    ]),
    beforeCapture: (tester) async {
      // Show the morning, where every case is visible.
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, 2000));
      await tester.pumpAndSettle();
    },
  );

  goldenTest(
    'DST fall-back day: 25 hours, "01:00 (2nd)" (America/New_York)',
    fileName: 'timeline_dst',
    surfaceSize: const Size(400, 600),
    textScales: const [1.0],
    builder: (_) => timeline(newYork, LocalDate(2026, 11, 1), [
      makeEntry('sleep', labelId: 'sleep', start: '2026-10-31T23:00:00-04:00', end: '2026-11-01T07:00:00-05:00'),
    ], now: '2026-11-02T12:00:00Z'),
    beforeCapture: (tester) async {
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, 2000));
      await tester.pumpAndSettle();
    },
  );
}
