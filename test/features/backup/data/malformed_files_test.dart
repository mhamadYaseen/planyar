// Malformed backup files (plan §11.4, J17): each case gives the right
// problem — which picks the message the user sees — and leaves the database
// unchanged.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/error/failures.dart';
import 'package:planyar/src/core/utils/data_state.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_actions.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_files.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_manifest.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/entities/import_report.dart';
import 'package:planyar/src/features/backup/domain/services/backup_format.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../backup_deps.dart';
import '../backup_test_data.dart';
import '../backup_zip_helpers.dart';

void main() {
  late BackupDeps deps;
  late BackupData before;

  setUpAll(tzdata.initializeTimeZones);
  setUp(() async {
    deps = await BackupDeps.create();
    await deps.seed(sampleData());
    before = await deps.backups.readSnapshot();
  });
  tearDown(() => deps.close());

  /// Writes [bytes] to a file and previews it as a picked file.
  Future<DataState<ImportPreview>> preview(List<int> bytes, {String name = 'backup.zip'}) async {
    final file = File('${await deps.files.temporaryDirectory()}/picked-$name')..writeAsBytesSync(bytes);
    final result = await deps.prepare(ImportSource(path: file.path, fileName: name, isTemporaryCopy: true));
    expect(file.existsSync(), isFalse, reason: "a picked file's temporary copy is always deleted");
    expect(await deps.backups.readSnapshot(), before, reason: 'the database must be unchanged');
    return result;
  }

  Future<void> expectProblem(List<int> bytes, BackupFileProblem problem) async {
    final result = await preview(bytes);
    expect(
      result,
      isA<DataError<ImportPreview>>().having(
        (e) => e.failure,
        'failure',
        isA<ValidationFailure>().having((f) => f.reason, 'reason', problem),
      ),
    );
  }

  /// A file that reads fine but leaves one record out with [reason].
  Future<void> expectIssue(
    Map<String, Object?> json,
    IssueReason reason, {
    BackupTable table = BackupTable.entries,
  }) async {
    final result = await preview(backupOf(json));
    final summary = (result as DataSuccess<ImportPreview>).data.merge;
    expect(summary.issues.map((i) => (i.table, i.reason)), contains((table, reason)));
  }

  Map<String, Object?> sample([void Function(Map<String, Object?> json)? change]) {
    final json = dataJson(sampleData());
    change?.call(json);
    return json;
  }

  group('the whole file is refused', () {
    test('1. empty file', () => expectProblem(const [], BackupFileProblem.notABackup));
    test('2. a text file', () => expectProblem(utf8.encode('hello'), BackupFileProblem.notABackup));
    test(
      '3. a bare data.json (not a ZIP)',
      () => expectProblem(utf8.encode(jsonEncode(sample())), BackupFileProblem.notABackup),
    );
    test('4. a ZIP without a manifest', () async {
      await expectProblem(zipOf({'data.json': utf8.encode(jsonEncode(sample()))}), BackupFileProblem.notABackup);
    });
    test('5. a ZIP without data.json', () async {
      await expectProblem(zipOf({'manifest.json': manifestFor(const [])}), BackupFileProblem.notABackup);
    });
    test('6. another app\'s format', () async {
      await expectProblem(
        backupOf(sample(), manifest: (m) => m['format'] = 'other-backup'),
        BackupFileProblem.notABackup,
      );
    });
    test('7. a manifest that is not JSON', () async {
      await expectProblem(
        zipOf({'manifest.json': utf8.encode('{nope'), 'data.json': const []}),
        BackupFileProblem.notABackup,
      );
    });
    test('8. a newer format version (J17 AC3)', () async {
      await expectProblem(
        backupOf(sample(), manifest: (m) => m['formatVersion'] = BackupFormat.version + 1),
        BackupFileProblem.newerVersion,
      );
    });
    test('9. an encrypted backup (a later feature)', () async {
      await expectProblem(
        backupOf(sample(), manifest: (m) => m['encryption'] = 'aes-256-gcm'),
        BackupFileProblem.newerVersion,
      );
    });
    test('10. checksum mismatch', () async {
      final data = utf8.encode(jsonEncode(sample()));
      final other = utf8.encode(jsonEncode(sample((j) => (j['labels']! as List).removeLast())));
      await expectProblem(zipOf({'manifest.json': manifestFor(other), 'data.json': data}), BackupFileProblem.damaged);
    });
    test('11. a truncated ZIP', () async {
      final whole = backupOf(sample());
      await expectProblem(whole.sublist(0, whole.length ~/ 2), BackupFileProblem.notABackup);
    });
    test('12. truncated JSON (checksum matches the cut file)', () async {
      final data = utf8.encode(jsonEncode(sample()));
      await expectProblem(backupOfBytes(data.sublist(0, data.length - 40)), BackupFileProblem.damaged);
    });
    test('13. invalid UTF-8', () async {
      final data = [...utf8.encode('{"labels": [{"name": "'), 0xff, 0xfe, ...utf8.encode('"}]}')];
      await expectProblem(backupOfBytes(data), BackupFileProblem.damaged);
    });
    test(
      '14. data.json is not an object',
      () => expectProblem(backupOfBytes(utf8.encode('[]')), BackupFileProblem.damaged),
    );
    test('15. an array of the wrong type', () {
      return expectProblem(backupOf(sample((j) => j['entries'] = {'not': 'a list'})), BackupFileProblem.damaged);
    });
    test('16. zip bomb: an absurd compression ratio', () async {
      // ~3 MB of spaces compresses to a few KB.
      final data = utf8.encode('{"entries": []${' ' * (3 * 1024 * 1024)}}');
      final zip = backupOfBytes(data);
      expect(data.length / zip.length, greaterThan(BackupFormat.maxCompressionRatio));
      await expectProblem(zip, BackupFileProblem.damaged);
    });
    test('17. entry names with ../ are never used', () async {
      final data = utf8.encode(jsonEncode(sample()));
      // Only path-like names: not a backup.
      await expectProblem(
        zipOf({'../manifest.json': manifestFor(data), '../../data.json': data}),
        BackupFileProblem.notABackup,
      );
      // The real files plus a hostile extra: the extra is ignored, nothing is
      // written outside (or inside) any folder.
      final outside = File('${deps.files.root.path}/evil.sh');
      final result = await preview(
        zipOf({'manifest.json': manifestFor(data), 'data.json': data, '../evil.sh': utf8.encode('rm -rf /')}),
      );
      expect(result, isA<DataSuccess<ImportPreview>>());
      expect(outside.existsSync(), isFalse);
    });
    test('18. over 200 MB', () async {
      final file = File('${await deps.files.temporaryDirectory()}/huge.zip');
      final handle = file.openSync(mode: FileMode.write)
        ..setPositionSync(BackupFormat.maxFileBytes)
        ..writeByteSync(0);
      handle.closeSync();
      final result = await deps.prepare(ImportSource(path: file.path, fileName: 'huge.zip', isTemporaryCopy: true));
      expect(
        (result as DataError).failure,
        isA<ValidationFailure>().having((f) => f.reason, 'reason', BackupFileProblem.tooLarge),
      );
      expect(await deps.backups.readSnapshot(), before);
    });
    test('19. a file that disappeared before it was read', () async {
      final result = await deps.prepare(const ImportSource(path: '/nonexistent/backup.zip', fileName: 'backup.zip'));
      expect(
        (result as DataError).failure,
        isA<ValidationFailure>().having((f) => f.reason, 'reason', BackupFileProblem.unreadable),
      );
    });
  });

  group('the file is read; bad records are listed and left out (J17 AC2)', () {
    test(
      '20. wrong types',
      () => expectIssue(sample((j) => record(j, 'entries')['utcOffsetMin'] = 'x'), IssueReason.wrongType),
    );
    test(
      '21. missing required field',
      () => expectIssue(sample((j) => record(j, 'entries').remove('kind')), IssueReason.missingField),
    );
    test(
      '22. invalid enum',
      () => expectIssue(sample((j) => record(j, 'entries')['source'] = 'magic'), IssueReason.badValue),
    );
    test(
      '23. bad UUID',
      () => expectIssue(sample((j) => record(j, 'entries')['id'] = 'not-a-uuid'), IssueReason.badId),
    );
    test('24. end before start', () {
      return expectIssue(
        sample((j) => record(j, 'entries')['endUtc'] = '2026-10-25T05:00:00Z'),
        IssueReason.endNotAfterStart,
      );
    });
    test('25. an 8-day entry', () {
      return expectIssue(
        sample((j) => record(j, 'entries')['endUtc'] = '2026-11-02T07:00:00Z'),
        IssueReason.longerThan7Days,
      );
    });
    test('26. a dangling reference', () async {
      final json = sample((j) => record(j, 'taskReminders')['taskId'] = uuid(999));
      final result = await preview(backupOf(json));
      final summary = (result as DataSuccess<ImportPreview>).data.replace;
      expect(
        summary.issues.single,
        RecordIssue(
          table: BackupTable.taskReminders,
          id: uuid(33),
          reason: IssueReason.missingReference,
          field: 'taskId',
        ),
      );
    });
    test('27. duplicate IDs', () {
      return expectIssue(
        sample((j) => (j['labels']! as List).add(record(j, 'labels'))),
        IssueReason.duplicateId,
        table: BackupTable.labels,
      );
    });
    test('28. two labels with the same name', () {
      return expectIssue(
        sample((j) => record(j, 'labels', 1)['name'] = 'STUDY'),
        IssueReason.duplicateName,
        table: BackupTable.labels,
      );
    });
    test(
      '29. huge strings',
      () => expectIssue(sample((j) => record(j, 'entries')['note'] = '∞' * 100000), IssueReason.tooLong),
    );
    test(
      '30. a record that is not an object',
      () => expectIssue(sample((j) => (j['entries']! as List)[0] = 42), IssueReason.notAnObject),
    );
  });
}
