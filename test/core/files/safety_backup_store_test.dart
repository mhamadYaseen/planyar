// Safety backups (plan §10.8, BAK-04): names carry date and reason, the
// newest five are kept, writes are atomic and never overwrite.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/files/safety_backup.dart';
import 'package:planyar/src/core/files/safety_backup_store.dart';
import 'package:planyar/src/core/time/instant.dart';

void main() {
  late Directory dir;
  late SafetyBackupStore store;
  final t = Instant.parse('2026-10-25T14:30:00Z');

  setUp(() {
    dir = Directory.systemTemp.createTempSync('planyar_safety_');
    store = SafetyBackupStore(() async => dir.path);
  });
  tearDown(() => dir.deleteSync(recursive: true));

  test('file names round-trip; other files are ignored', () {
    final name = SafetyBackup.fileNameFor(t, SafetyReason.erase);
    expect(name, 'planyar-safety-${t.utcMs}-erase.zip');
    expect(SafetyBackup.fileNameFor(t, SafetyReason.migration), endsWith('-migration.sqlite'));
    final parsed = SafetyBackup.fromPath('/x/safety/$name')!;
    expect((parsed.createdAt, parsed.reason, parsed.isRawDatabase), (t, SafetyReason.erase, false));
    for (final other in [
      'notes.txt',
      'planyar-safety-abc-import.zip',
      'planyar-safety-1-unknown.zip',
      '$name.partial',
    ]) {
      expect(SafetyBackup.fromPath('/x/safety/$other'), isNull, reason: other);
    }
  });

  test('writes newest first, keeps five, never overwrites one with the same time', () async {
    for (var i = 0; i < 7; i++) {
      await store.write(
        [i],
        at: t + Duration(minutes: i),
        reason: SafetyReason.import,
      );
    }
    final twin = await store.write([99], at: t + const Duration(minutes: 6), reason: SafetyReason.import);
    final kept = await store.list();
    expect(kept, hasLength(SafetyBackupStore.keep));
    expect(kept.first, twin);
    expect(File(twin.path).readAsBytesSync(), [99]);
    expect(kept.map((b) => File(b.path).readAsBytesSync().single), [99, 6, 5, 4, 3]);
  });

  test('a write that was cut off leaves no half file behind', () async {
    final folder = Directory('${dir.path}/safety')..createSync();
    File('${folder.path}/${SafetyBackup.fileNameFor(t, SafetyReason.import)}.partial').writeAsStringSync('half');
    await store.write([1], at: t + const Duration(hours: 1), reason: SafetyReason.import);
    expect(folder.listSync().map((f) => f.path).where((p) => p.endsWith('.partial')), isEmpty);
    expect(await store.list(), hasLength(1));
  });
}
