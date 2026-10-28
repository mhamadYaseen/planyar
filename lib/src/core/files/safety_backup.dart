import '../time/instant.dart';

/// Why a safety backup was made (plan §10.8, BAK-04).
enum SafetyReason {
  /// Before an import (including restoring a safety backup).
  import,

  /// Before "Erase all data" (SET-06).
  erase,

  /// Before a database schema migration: a raw copy of the database file.
  migration,
}

/// A backup the app made by itself into its private `safety/` folder. The
/// newest five are kept; they're deleted with the app.
final class SafetyBackup {
  const SafetyBackup({required this.path, required this.createdAt, required this.reason});

  final String path;
  final Instant createdAt;
  final SafetyReason reason;

  static const _prefix = 'planyar-safety-';
  static final _namePattern = RegExp(r'^planyar-safety-(\d{1,16})-([a-z]+)\.(zip|sqlite)$');

  String get fileName => path.substring(path.lastIndexOf('/') + 1);

  /// A raw copy of the database (migrations) rather than a backup ZIP. It
  /// can be shared, but not imported.
  bool get isRawDatabase => path.endsWith('.sqlite');

  /// `planyar-safety-<utc ms>-<reason>.zip` (`.sqlite` for migrations): the
  /// name alone carries the date and reason, so listing needs no reads.
  static String fileNameFor(Instant at, SafetyReason reason) =>
      '$_prefix${at.utcMs}-${reason.name}.${reason == SafetyReason.migration ? 'sqlite' : 'zip'}';

  /// Null for files that aren't safety backups.
  static SafetyBackup? fromPath(String path) {
    final match = _namePattern.firstMatch(path.substring(path.lastIndexOf('/') + 1));
    if (match == null) return null;
    final reason = SafetyReason.values.where((r) => r.name == match.group(2)).firstOrNull;
    if (reason == null) return null;
    return SafetyBackup(path: path, createdAt: Instant.fromUtcMs(int.parse(match.group(1)!)), reason: reason);
  }

  @override
  bool operator ==(Object other) =>
      other is SafetyBackup && other.path == path && other.createdAt == createdAt && other.reason == reason;

  @override
  int get hashCode => Object.hash(path, createdAt, reason);

  @override
  String toString() => 'SafetyBackup($fileName)';
}
