// Export, import and erase end to end over the real data layer (plan
// §10.5–10.8, J15–J17, BAK-01…BAK-05, SET-06).
import 'dart:io';
import 'dart:typed_data';

import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/error/failures.dart';
import 'package:planyar/src/core/files/file_gateway.dart';
import 'package:planyar/src/core/files/safety_backup.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/usecases/usecase.dart';
import 'package:planyar/src/core/utils/data_state.dart';
import 'package:planyar/src/features/backup/data/datasource/backup_archive.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_actions.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_files.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_manifest.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_plan.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/usecases/backup_usecases.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import 'backup_deps.dart';
import 'backup_test_data.dart';
import 'backup_zip_helpers.dart';

T ok<T>(DataState<T> state) => switch (state) {
  DataSuccess(:final data) => data,
  _ => throw TestFailure('Expected success, got $state'),
};

Failure failed(DataState<Object?> state) => switch (state) {
  DataError(:final failure) => failure,
  _ => throw TestFailure('Expected an error, got $state'),
};

void main() {
  late BackupDeps deps;
  final now = DateTime.utc(2026, 10, 25, 14, 30);

  setUpAll(tzdata.initializeTimeZones);
  setUp(() async => deps = await BackupDeps.create());
  tearDown(() => deps.close());

  /// Exports [from] and returns the shared ZIP's bytes.
  Future<Uint8List> exportBytes(BackupDeps from) async {
    ok(await from.export(const ExportParams(ExportDestination.share)));
    return Uint8List.fromList(from.files.sharedBytes.last);
  }

  /// Puts [bytes] where the picker will find them and previews them.
  Future<ImportPreview> pickAndPreview(BackupDeps into, List<int> bytes, {String name = 'backup.zip'}) async {
    into.files.fileToPick = File('${into.files.root.path}/$name')..writeAsBytesSync(bytes);
    final source = ok(await into.pick(const NoParams()))!;
    return ok(await into.prepare(source));
  }

  group('export (BAK-01, BAK-05)', () {
    test('shares one ZIP named by local time; records the export; deletes the temporary file (J15 AC1)', () async {
      await deps.seed(sampleData());
      final result = await withClock(Clock.fixed(now), () => deps.export(const ExportParams(ExportDestination.share)));
      expect(
        ok(result),
        const ExportResult(fileName: 'planyar-backup-2026-10-25-1730.zip', recordCount: 17, completed: true),
      );
      expect(deps.files.shared.single.single, endsWith('/planyar-backup-2026-10-25-1730.zip'));
      expect(deps.files.temporaryFiles, isEmpty);
      expect((await deps.backups.watchStatus().first).lastExportAt, Instant.fromDateTime(now));

      // The manifest counts match the records (J15 AC2).
      final decoded = BackupArchive.decode(Uint8List.fromList(deps.files.sharedBytes.single));
      expect(decoded.manifest.counts, sampleData().counts);
      expect(decoded.manifest.deviceTimeZone, 'Asia/Baghdad');
      expect(decoded.manifest.platform, 'android');
      expect(decoded.parsed.data, sampleData());
    });

    test('a dismissed share sheet is not counted as an export', () async {
      deps.files.shareOutcome = ShareOutcome.dismissed;
      expect(ok(await deps.export(const ExportParams(ExportDestination.share))).completed, isFalse);
      expect((await deps.backups.watchStatus().first).lastExportAt, isNull);
      expect(deps.files.temporaryFiles, isEmpty);
    });

    test('"Save to device" saves the same ZIP', () async {
      await deps.seed(sampleData());
      expect(ok(await deps.export(const ExportParams(ExportDestination.device))).completed, isTrue);
      expect(BackupArchive.decode(Uint8List.fromList(deps.files.saved.single.bytes)).parsed.data, sampleData());
      expect((await deps.backups.watchStatus().first).lastExportAt, isNotNull);
    });

    test('a failing share sheet is an error and still cleans up', () async {
      deps.files.throwOnShare = StateError('no activity');
      expect(failed(await deps.export(const ExportParams(ExportDestination.share))), isA<PlatformFailure>());
      expect(deps.files.temporaryFiles, isEmpty);
    });
  });

  group('import', () {
    test('J15: export, then Replace on a fresh install restores every record', () async {
      await deps.seed(sampleData());
      final bytes = await exportBytes(deps);
      final fresh = await BackupDeps.create();
      addTearDown(fresh.close);

      final preview = await pickAndPreview(fresh, bytes);
      expect(preview.localRecordCount, 0);
      expect(preview.backup.manifest.counts, sampleData().counts);
      final result = ok(await fresh.run(RunImportParams(backup: preview.backup, mode: ImportMode.replace)));
      expect(result.safetyBackup, isNull, reason: 'nothing to save on an empty device');
      expect(result.integrityOk, isTrue);
      expect(await fresh.backups.readSnapshot(), sampleData());
      expect(fresh.files.temporaryFiles, isEmpty, reason: 'the picked copy is deleted after reading');
    });

    test('J16: merge with conflicts — preview counts, matched by name, safety backup first', () async {
      await deps.seed(
        BackupData(
          labels: [label(10, 'Study'), label(12, 'Reading')],
          entries: [
            entry(50, label: 10, note: 'mine', updated: t1),
            entry(60, label: 10, note: 'local only'),
          ],
        ),
      );
      final before = await deps.backups.readSnapshot();
      final file = BackupData(
        labels: [
          label(10, 'Study'),
          label(13, 'reading', color: 'violet'),
        ],
        entries: [
          entry(50, label: 10, note: 'theirs'),
          entry(51, label: 13),
          entry(52, label: 10, note: 'local only'),
          entry(60, label: 10, note: 'local only'),
        ],
      );
      final other = await BackupDeps.create();
      addTearDown(other.close);
      await other.seed(file);
      final preview = await pickAndPreview(deps, await exportBytes(other));

      final merge = preview.merge;
      expect(merge.of(BackupTable.entries), const TableSummary(added: 2, overwritten: 1, unchanged: 1));
      expect(merge.of(BackupTable.labels), const TableSummary(overwritten: 1, unchanged: 1, matchedByName: 1));
      expect(merge.localNewer, 1);
      // Replace compares with the device too (and warns about the newer edit).
      expect(preview.replace.of(BackupTable.entries), const TableSummary(added: 2, overwritten: 1, unchanged: 1));
      expect(preview.replace.localNewer, 1);

      final result = ok(await deps.run(RunImportParams(backup: preview.backup, mode: ImportMode.merge)));
      // AC4: the safety backup holds the data as it was before the import.
      final safety = result.safetyBackup!;
      expect(safety.reason, SafetyReason.import);
      expect(BackupArchive.decode(File(safety.path).readAsBytesSync()).parsed.data, before);
      expect((await deps.backups.watchStatus().first).importLog.single.safetyBackupName, safety.fileName);

      final after = await deps.backups.readSnapshot();
      expect(after.labels.map((l) => (l.id, l.name, l.colorKey)), [
        (uuid(10), 'Study', 'teal'),
        (uuid(12), 'Reading', 'violet'),
      ]);
      expect(after.entries.firstWhere((e) => e.id == uuid(51)).labelId, uuid(12));
      expect(after.entries.firstWhere((e) => e.id == uuid(50)).note, 'theirs');
    });

    test('J17 AC2: 3 invalid entries out of 5,000 are listed; the import goes ahead without them', () async {
      final entries = [
        for (var i = 0; i < 5000; i++)
          entry(
            0x10000 + i,
            label: 10,
            start: (Instant.parse('2026-01-01T00:00:00Z') + Duration(hours: i)).toString(),
            end: (Instant.parse('2026-01-01T00:30:00Z') + Duration(hours: i)).toString(),
          ),
      ];
      final json = dataJson(BackupData(labels: [label(10, 'Study')], entries: entries));
      record(json, 'entries', 7)['endUtc'] = record(json, 'entries', 7)['startUtc'];
      record(json, 'entries', 70)['kind'] = 'someday';
      record(json, 'entries', 700)['id'] = 'oops';
      final preview = await pickAndPreview(deps, backupOf(json));
      expect(preview.replace.issues.map((i) => (i.index, i.reason)), [
        (7, IssueReason.endNotAfterStart),
        (70, IssueReason.badValue),
        (700, IssueReason.badId),
      ]);
      expect(await deps.backups.hasRecords(), isFalse, reason: 'nothing is written by the preview');
      final result = ok(await deps.run(RunImportParams(backup: preview.backup, mode: ImportMode.replace)));
      expect(result.summary.of(BackupTable.entries), const TableSummary(added: 4997, invalid: 3));
      expect((await deps.backups.readSnapshot()).entries, hasLength(4997));
    });

    test('a newer backup is refused with "update the app" (J17 AC3)', () async {
      final bytes = backupOf(dataJson(sampleData()), manifest: (m) => m['formatVersion'] = 2);
      deps.files.fileToPick = File('${deps.files.root.path}/new.zip')..writeAsBytesSync(bytes);
      final source = ok(await deps.pick(const NoParams()))!;
      expect(
        failed(await deps.prepare(source)),
        isA<ValidationFailure>().having((f) => f.reason, 'reason', BackupFileProblem.newerVersion),
      );
    });

    test('a file over the limit is refused when picked', () async {
      final file = File('${deps.files.root.path}/huge.zip');
      final handle = file.openSync(mode: FileMode.write)
        ..setPositionSync(200 * 1024 * 1024)
        ..writeByteSync(0);
      handle.closeSync();
      deps.files.fileToPick = file;
      expect(
        failed(await deps.pick(const NoParams())),
        isA<ValidationFailure>().having((f) => f.reason, 'reason', BackupFileProblem.tooLarge),
      );
    });

    test('a failure in the middle of the apply rolls back; the safety backup is there (§11.4)', () async {
      await deps.seed(sampleData());
      final before = await deps.backups.readSnapshot();
      // A record no reader would pass: it breaks a CHECK inside the transaction.
      final broken = ReadBackup(
        fileName: 'broken.zip',
        sizeBytes: 1,
        manifest: BackupManifest(formatVersion: 1, dataSha256: 'a' * 64),
        parsed: ParsedBackup(
          data: BackupData(
            labels: [label(10, 'Study')],
            entries: [entry(80, label: 10).copyWith(end: Instant.parse('2026-10-25T05:00:00Z'))],
          ),
        ),
      );
      expect(failed(await deps.run(RunImportParams(backup: broken, mode: ImportMode.replace))), isA<DatabaseFailure>());
      expect(await deps.backups.readSnapshot(), before);
      final safety = await deps.backupFiles.listSafetyBackups();
      expect(safety.single.reason, SafetyReason.import);
      expect((await deps.backups.watchStatus().first).importLog, isEmpty);
    });

    test('if the safety backup fails, nothing is imported', () async {
      await deps.seed(sampleData());
      final before = await deps.backups.readSnapshot();
      // Make the safety folder impossible to create.
      File('${await deps.files.supportDirectory()}/safety').writeAsStringSync('in the way');
      final preview = await pickAndPreview(deps, backupOf(dataJson(BackupData(labels: [label(90, 'New')]))));
      expect(
        failed(await deps.run(RunImportParams(backup: preview.backup, mode: ImportMode.replace))),
        isA<PlatformFailure>(),
      );
      expect(await deps.backups.readSnapshot(), before);
    });

    test('restoring a safety backup undoes an import', () async {
      await deps.seed(sampleData());
      final before = await deps.backups.readSnapshot();
      final preview = await pickAndPreview(deps, backupOf(dataJson(BackupData(labels: [label(90, 'New')]))));
      final safety = ok(await deps.run(RunImportParams(backup: preview.backup, mode: ImportMode.replace)))
          .safetyBackup!;
      expect((await deps.backups.readSnapshot()).labels.single.name, 'New');

      final restore = ok(
        await deps.prepare(ImportSource(path: safety.path, fileName: safety.fileName, replaceOnly: true)),
      );
      ok(await deps.run(RunImportParams(backup: restore.backup, mode: ImportMode.replace)));
      expect(await deps.backups.readSnapshot(), before);
      expect(File(safety.path).existsSync(), isTrue, reason: 'a safety backup is never deleted by restoring it');
    });

    test('only the newest five safety backups are kept', () async {
      await deps.seed(sampleData());
      for (var i = 0; i < 7; i++) {
        await deps.backupFiles.writeSafetyBackup(
          sampleData(),
          reason: SafetyReason.import,
          at: Instant.parse('2026-10-25T00:00:00Z') + Duration(minutes: i),
        );
      }
      final kept = await deps.backupFiles.listSafetyBackups();
      expect(kept.map((s) => s.createdAt.toString()), [
        for (var i = 6; i >= 2; i--) (Instant.parse('2026-10-25T00:00:00Z') + Duration(minutes: i)).toString(),
      ]);
    });
  });

  group('erase all data (SET-06)', () {
    test('saves a safety backup, then removes every record and setting', () async {
      await deps.seed(sampleData());
      final before = await deps.backups.readSnapshot();
      final safety = ok(await deps.erase(const NoParams()))!;
      expect(safety.reason, SafetyReason.erase);
      expect(BackupArchive.decode(File(safety.path).readAsBytesSync()).parsed.data, before);
      expect(await deps.backups.hasRecords(), isFalse);
      expect(await deps.db.select(deps.db.settings).get(), isEmpty);
    });

    test('an empty device needs no safety backup', () async {
      expect(ok(await deps.erase(const NoParams())), isNull);
    });
  });
}
