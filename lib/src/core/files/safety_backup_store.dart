import 'dart:io';

import '../time/instant.dart';
import 'safety_backup.dart';

/// The `safety/` folder in the app's support directory (plan §10.8): newest
/// [keep] files are kept, older ones pruned. Android Auto Backup excludes it
/// (`data_extraction_rules.xml`), so restoring a phone doesn't bring back
/// stale safety copies.
final class SafetyBackupStore {
  SafetyBackupStore(this._supportDirectory);

  final Future<String> Function() _supportDirectory;

  static const keep = 5;

  Future<Directory> _folder() async => Directory('${await _supportDirectory()}/safety').create(recursive: true);

  /// Newest first.
  Future<List<SafetyBackup>> list() async {
    final folder = await _folder();
    final found = [
      await for (final item in folder.list())
        if (item is File) ?SafetyBackup.fromPath(item.path),
    ];
    return found..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// A free path for a new safety backup (never overwrites one).
  Future<String> pathFor(Instant at, SafetyReason reason) async {
    final folder = await _folder();
    var stamp = at;
    while (true) {
      final path = '${folder.path}/${SafetyBackup.fileNameFor(stamp, reason)}';
      if (!File(path).existsSync()) return path;
      stamp += const Duration(milliseconds: 1);
    }
  }

  /// Writes [bytes] atomically (temp file, then rename), then prunes.
  Future<SafetyBackup> write(List<int> bytes, {required Instant at, required SafetyReason reason}) async {
    final path = await pathFor(at, reason);
    final partial = File('$path.partial');
    await partial.writeAsBytes(bytes, flush: true);
    await partial.rename(path);
    await prune();
    return SafetyBackup.fromPath(path)!;
  }

  /// Deletes all but the newest [keep] (and stray partial files).
  Future<void> prune() async {
    final all = await list();
    for (final old in all.skip(keep)) {
      await File(old.path).delete();
    }
    final folder = await _folder();
    await for (final item in folder.list()) {
      if (item is File && item.path.endsWith('.partial')) await item.delete();
    }
  }
}
