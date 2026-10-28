// Phase 2 DoD: a 10k-entry backup imports in < 5 s; plan §10.5: 10,000
// entries export in < 2 s. These are desktop numbers (JIT, debug); the
// phone benchmark (§11.4, 20k entries) is recorded by hand per release.
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/usecases/usecase.dart';
import 'package:planyar/src/core/utils/data_state.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_actions.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_files.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/usecases/backup_usecases.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import 'backup_deps.dart';
import 'backup_test_data.dart';

BackupData manyEntries(int count) => BackupData(
  labels: [for (var i = 0; i < 12; i++) label(10 + i, 'Label $i')],
  entries: [
    for (var i = 0; i < count; i++)
      entry(
        0x100000 + i,
        label: 10 + i % 12,
        kind: i.isEven ? 'actual' : 'planned',
        start: (Instant.parse('2020-01-01T00:00:00Z') + Duration(minutes: 90 * i)).toString(),
        end: (Instant.parse('2020-01-01T01:00:00Z') + Duration(minutes: 90 * i)).toString(),
        note: i % 5 == 0 ? 'Note number $i — with some text' : null,
      ),
  ],
);

void main() {
  setUpAll(tzdata.initializeTimeZones);

  for (final count in [10000, 20000]) {
    test('$count entries: export, then preview and Replace import on a fresh device', () async {
      final source = await BackupDeps.create();
      final target = await BackupDeps.create();
      addTearDown(source.close);
      addTearDown(target.close);
      await source.seed(manyEntries(count));

      final clock = Stopwatch()..start();
      final exported = await source.export(const ExportParams(ExportDestination.share));
      final exportMs = clock.elapsedMilliseconds;
      expect(exported, isA<DataSuccess<ExportResult>>());
      final bytes = Uint8List.fromList(source.files.sharedBytes.single);

      target.files.fileToPick = File('${target.files.root.path}/big.zip')..writeAsBytesSync(bytes);
      clock.reset();
      final picked = (await target.pick(const NoParams()) as DataSuccess<ImportSource?>).data!;
      final preview = (await target.prepare(picked) as DataSuccess<ImportPreview>).data;
      final result = await target.run(RunImportParams(backup: preview.backup, mode: ImportMode.replace));
      final importMs = clock.elapsedMilliseconds;
      expect(result, isA<DataSuccess<ImportResult>>());
      expect((await target.backups.readSnapshot()).entries, hasLength(count));

      // ignore: avoid_print
      print('$count entries: export $exportMs ms (${bytes.length ~/ 1024} KB), import $importMs ms');
      if (count == 10000) {
        expect(exportMs, lessThan(2000));
        expect(importMs, lessThan(5000));
      }
    }, timeout: const Timeout(Duration(minutes: 2)));
  }
}
