// Frozen backup files, one per format version ever released (plan §11.4):
// they must import successfully forever. Never regenerate a released one;
// add test/fixtures/backups/vN/ for a new format version instead.
//
// To create a missing fixture: flutter test --dart-define=CREATE_BACKUP_FIXTURE=true test/features/backup/backup_fixtures_test.dart
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_archive.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_writer.dart';
import 'package:planyar/src/features/backup/domain/services/import_planner.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import 'backup_deps.dart';
import 'backup_test_data.dart';

const _create = bool.fromEnvironment('CREATE_BACKUP_FIXTURE');

void main() {
  setUpAll(tzdata.initializeTimeZones);

  test('format v1 imports with every record', () async {
    final file = File('test/fixtures/backups/v1/planyar-backup-v1.zip');
    if (_create && !file.existsSync()) {
      file.writeAsBytesSync(
        BackupArchive.encode(
          sampleData(),
          ExportInfo(
            appVersion: '1.0.0+1',
            dbSchemaVersion: 1,
            createdAt: Instant.parse('2026-10-27T12:00:00Z'),
            deviceTimeZone: 'Asia/Baghdad',
            platform: 'android',
          ),
        ),
      );
    }
    final decoded = BackupArchive.decode(file.readAsBytesSync());
    expect(decoded.manifest.formatVersion, 1);
    expect(decoded.parsed.issues, isEmpty);
    expect(decoded.parsed.repairs, isEmpty);
    final data = decoded.parsed.data;
    // Frozen expectations — independent of today's test data helpers.
    expect(data.counts, {
      BackupTable.categories: 2,
      BackupTable.labels: 4,
      BackupTable.taskSeries: 1,
      BackupTable.tasks: 2,
      BackupTable.taskReminders: 1,
      BackupTable.routines: 1,
      BackupTable.routineExceptions: 1,
      BackupTable.entries: 5,
    });
    expect(data.settings, {'firstDayOfWeek': 5, 'themeMode': 'dark'});
    final overnight = data.entries.singleWhere((e) => e.source == 'from_plan');
    expect(
      (overnight.start, overnight.end),
      (Instant.parse('2026-10-25T20:10:00Z'), Instant.parse('2026-10-26T03:50:00Z')),
    );
    expect(data.entries.singleWhere((e) => e.source == 'routine').occurrenceDate, LocalDate(2026, 10, 25));
    expect(data.labels.map((l) => l.name), ['Study', 'Exercise', 'Sleep', 'Old']);

    // Every field survives: writing the records again gives the frozen
    // data.json. Renaming or dropping a field in both the writer and the
    // reader would fail here, because the file can't change.
    final frozen = jsonDecode(
      utf8.decode(ZipDecoder().decodeBytes(file.readAsBytesSync()).findFile('data.json')!.readBytes()!),
    );
    expect(jsonDecode(jsonEncode(BackupJsonWriter.data(data))), frozen);

    final deps = await BackupDeps.create();
    addTearDown(deps.close);
    final plan = await deps.backups.applyImport(
      (current) => const ImportPlanner().plan(
        file: decoded.parsed,
        current: current,
        mode: ImportMode.replace,
        importSettings: true,
        now: Instant.parse('2026-10-27T12:00:00Z'),
        newId: deps.ids.newId,
      ),
    );
    expect(plan.summary.invalidCount, 0);
    expect((await deps.backups.readSnapshot()).counts, data.counts);
  });
}
