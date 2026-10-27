import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/settings/data/datasource/settings_dao.dart';
import 'package:planyar/src/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:planyar/src/features/settings/domain/entities/app_settings.dart';

import '../../../helpers/test_database.dart';

void main() {
  late AppDatabase db;
  late SettingsRepositoryImpl repo;

  setUp(() {
    db = newTestDatabase();
    repo = SettingsRepositoryImpl(SettingsDao(db));
  });

  tearDown(() => db.close());

  test('defaults: system theme, Friday week start (D-09), timeline, split lanes', () async {
    expect(await repo.load(), const AppSettings());
    expect((await repo.load()).firstDayOfWeek, DateTime.friday);
  });

  test('saves only changed keys, with portable/device scopes', () async {
    await repo.save(const AppSettings(laneMode: LaneMode.combined, onboardingCompleted: true));
    final rows = {for (final r in await db.select(db.settings).get()) r.key: (r.value, r.scope)};
    expect(rows['laneMode'], ('"combined"', 'portable'));
    expect(rows['onboardingCompleted'], ('true', 'device'));
    expect(rows['firstDayOfWeek'], ('5', 'portable'));
    expect(await repo.load(), const AppSettings(laneMode: LaneMode.combined, onboardingCompleted: true));
  });

  test('malformed or unknown values fall back to defaults', () async {
    for (final (key, value) in [('themeMode', '"purple"'), ('firstDayOfWeek', '9'), ('timelineMode', '{oops')]) {
      await db
          .into(db.settings)
          .insert(SettingsCompanion.insert(key: key, value: value, scope: 'portable', updatedAt: Instant.fromUtcMs(0)));
    }
    expect(await repo.load(), const AppSettings());
  });

  test('watch emits changes', () async {
    final check = expectLater(
      repo.watch().map((s) => s.dayViewMode),
      emitsInOrder([DayViewMode.timeline, DayViewMode.list]),
    );
    await pumpEventQueue();
    await repo.save(const AppSettings(dayViewMode: DayViewMode.list));
    await check;
  });
}
