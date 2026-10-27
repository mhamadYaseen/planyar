// Performance budget (plan §8.5): with 20,000 entries (~5 years), the day
// query stays well under 20 ms. In-memory SQLite on a dev machine/CI runner,
// so the assertion is generous; the measured time is printed.
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/test_deps.dart';

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('day query with 20,000 entries', () async {
    final deps = await TestDeps.create();
    final label = await deps.labels.create(name: 'Work');
    final math = deps.zones.dayMath;
    final first = LocalDate(2021, 11, 1);
    final drafts = [
      for (var day = 0; day < 1825; day++)
        for (var slot = 0; slot < 11; slot++)
          EntryDraft(
            kind: slot.isEven ? EntryKind.actual : EntryKind.planned,
            labelId: label.id,
            start: math.local(first.addDays(day), 7 * 60 + slot * 80),
            end: math.local(first.addDays(day), 7 * 60 + slot * 80 + 75),
          ),
    ];
    expect(await deps.entries.createMany(drafts), 20075);

    final day = math.dayBounds(LocalDate(2024, 6, 15));
    await deps.entries.inRange(day); // warm up
    final watch = Stopwatch()..start();
    const runs = 50;
    for (var i = 0; i < runs; i++) {
      await deps.entries.inRange(day);
    }
    final perQueryMs = watch.elapsedMicroseconds / runs / 1000;
    // ignore: avoid_print
    print('Day query with 20,075 entries: ${perQueryMs.toStringAsFixed(2)} ms');
    expect(perQueryMs, lessThan(20));
    expect((await deps.entries.inRange(day)).length, 11);
    await deps.close();
  });
}
