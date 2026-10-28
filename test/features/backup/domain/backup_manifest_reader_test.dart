// manifest.json checks (plan §10.6 stage 2, BAK-06) and format upgrades.
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_manifest.dart';
import 'package:planyar/src/features/backup/domain/entities/backup_records.dart';
import 'package:planyar/src/features/backup/domain/services/backup_format.dart';
import 'package:planyar/src/features/backup/domain/services/backup_json_writer.dart';
import 'package:planyar/src/features/backup/domain/services/backup_manifest_reader.dart';

void main() {
  final manifest = BackupManifest(
    formatVersion: 1,
    appVersion: '1.0.0+1',
    dbSchemaVersion: 1,
    createdAt: Instant.parse('2026-10-25T14:30:00Z'),
    deviceTimeZone: 'Asia/Baghdad',
    platform: 'android',
    counts: const {BackupTable.labels: 18, BackupTable.entries: 4210},
    dataSha256: 'a' * 64,
  );

  Map<String, Object?> json([void Function(Map<String, Object?>)? change]) {
    final value = {...BackupJsonWriter.manifest(manifest)};
    change?.call(value);
    return value;
  }

  Matcher problem(BackupFileProblem p) => throwsA(isA<BackupFileException>().having((e) => e.problem, 'problem', p));

  test('writes the §10.4 shape and reads it back', () {
    final written = json();
    expect(written.keys, [
      'format', 'formatVersion', 'appVersion', 'dbSchemaVersion', 'createdAtUtc', 'deviceTimeZone', //
      'platform', 'counts', 'dataFile', 'dataSha256', 'encryption',
    ]);
    expect(written['format'], 'planyar-backup');
    expect((written['counts']! as Map)['entries'], 4210);
    expect((written['counts']! as Map)['tasks'], 0);
    expect(
      BackupManifestReader.read(written),
      manifest.copyWith(counts: {for (final t in BackupTable.values) t: manifest.counts[t] ?? 0}),
    );
  });

  test('wrong format or version → not a backup', () {
    expect(
      () => BackupManifestReader.read(json((m) => m['format'] = 'other-app')),
      problem(BackupFileProblem.notABackup),
    );
    expect(
      () => BackupManifestReader.read(json((m) => m['formatVersion'] = '1')),
      problem(BackupFileProblem.notABackup),
    );
    expect(() => BackupManifestReader.read(json((m) => m['formatVersion'] = 0)), problem(BackupFileProblem.notABackup));
    expect(() => BackupManifestReader.read(<Object?>[]), problem(BackupFileProblem.notABackup));
    expect(
      () => BackupManifestReader.read(json((m) => m['dataFile'] = '../data.json')),
      problem(BackupFileProblem.notABackup),
    );
  });

  test('a newer format version or encryption → update the app (J17 AC3)', () {
    expect(
      () => BackupManifestReader.read(json((m) => m['formatVersion'] = BackupFormat.version + 1)),
      problem(BackupFileProblem.newerVersion),
    );
    expect(
      () => BackupManifestReader.read(json((m) => m['encryption'] = 'aes-256-gcm')),
      problem(BackupFileProblem.newerVersion),
    );
  });

  test('a missing or malformed checksum → damaged', () {
    expect(() => BackupManifestReader.read(json((m) => m.remove('dataSha256'))), problem(BackupFileProblem.damaged));
    expect(() => BackupManifestReader.read(json((m) => m['dataSha256'] = 'abc')), problem(BackupFileProblem.damaged));
  });

  test('informational fields may be missing', () {
    final read = BackupManifestReader.read({'format': 'planyar-backup', 'formatVersion': 1, 'dataSha256': 'B' * 64});
    expect(read, BackupManifest(formatVersion: 1, dataSha256: 'b' * 64));
  });

  test('upgrader: the current version passes through; a missing step is damage', () {
    final data = <String, Object?>{'entries': <Object?>[]};
    expect(BackupUpgrader.upgrade(data, fromVersion: BackupFormat.version), same(data));
    expect(BackupUpgrader.steps, isEmpty, reason: 'v1 is the only format so far');
    expect(() => BackupUpgrader.upgrade(data, fromVersion: 0), problem(BackupFileProblem.damaged));
  });
}
