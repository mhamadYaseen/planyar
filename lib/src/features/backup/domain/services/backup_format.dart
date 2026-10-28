import '../../../../core/time/local_date.dart';
import '../../../../core/time/wall_time.dart';

/// The backup file format, version 1 (plan §10.4). Limits mirror the
/// database CHECK constraints, so a record that passes the reader can always
/// be inserted.
abstract final class BackupFormat {
  static const name = 'planyar-backup';

  /// Adding optional fields doesn't bump this; renaming, removing or
  /// changing the meaning of a field does, with a migration in
  /// `BackupUpgrader` kept forever.
  static const version = 1;

  static const manifestFile = 'manifest.json';
  static const dataFile = 'data.json';
  static const mimeType = 'application/zip';
  static const encryptionNone = 'none';

  // Import guards (§10.6 stage 1).
  static const maxFileBytes = 200 * 1024 * 1024;
  static const maxUnpackedBytes = 500 * 1024 * 1024;
  static const maxManifestBytes = 1024 * 1024;

  /// Unpacked/packed size: JSON compresses ~10×; a zip bomb ~1000×.
  static const maxCompressionRatio = 100;

  /// Small files skip the ratio check (ZIP headers dominate them).
  static const ratioCheckFromBytes = 1024 * 1024;

  // Enum values, as stored in the file and the database.
  static const entryKinds = {'planned', 'actual'};
  static const entrySources = {'manual', 'routine', 'from_plan'};
  static const routineFreqs = {'daily'};
  static const exceptionTypes = {'skip', 'modify'};
  static const seriesFreqs = {'daily', 'weekly', 'monthly', 'yearly'};
  static const seriesModes = {'schedule', 'after_completion'};
  static const taskStatuses = {'not_started', 'in_progress', 'completed'};
  static const taskPriorities = {'low', 'normal', 'high'};
  static const reminderTypes = {'at_start', 'before_deadline', 'on_deadline', 'custom'};

  // Text limits.
  static const maxNameLength = 40;
  static const maxRoutineNameLength = 60;
  static const maxNoteLength = 2000;
  static const maxTaskTitleLength = 120;
  static const maxTaskNotesLength = 5000;
  static const maxZoneIdLength = 64;

  /// Encoded JSON size of one settings value.
  static const maxSettingLength = 10000;

  static const maxEntryDuration = Duration(days: 7);

  /// Entries whose label is missing are attached to this archived label
  /// rather than dropped (§10.6 safe repairs).
  static const placeholderLabelName = 'Imported – unknown label';
  static const fallbackColorKey = 'gray';

  /// `planyar-backup-2026-10-25-1730.zip`, in local time.
  static String exportFileName(LocalDate date, WallTime time) {
    String two(int n) => n.toString().padLeft(2, '0');
    return 'planyar-backup-${date.toIso()}-${two(time.hour)}${two(time.minute)}.zip';
  }
}
