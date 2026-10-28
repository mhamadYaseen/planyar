/// File, share and picker access (plan §8.11). Every call to `share_plus`,
/// `file_picker` and `path_provider` goes through this interface, so their
/// churny APIs stay swappable and tests use a fake.
abstract interface class FileGateway {
  /// A cache folder the OS may clear; for exports and picked-file copies.
  Future<String> temporaryDirectory();

  /// The app's private support folder, kept until uninstall (safety backups).
  Future<String> supportDirectory();

  /// Where the database file lives.
  Future<String> documentsDirectory();

  /// Opens the share sheet ("Save to Files", Drive, email, …).
  Future<ShareOutcome> shareFiles(List<String> paths, {required String mimeType, String? subject, ShareAnchor? anchor});

  /// Opens the system "Save as" dialog. True when the file was saved.
  Future<bool> saveFile({required String fileName, required List<int> bytes, required String mimeType});

  /// Lets the user pick one file of any type (custom filters work badly on
  /// Android) and copies it into the temporary folder. Null when cancelled.
  /// Throws [FileTooLargeException] when it's over [maxBytes].
  Future<PickedFile?> pickFile({required int maxBytes});
}

enum ShareOutcome {
  /// The user chose a target app.
  shared,

  /// The user closed the sheet.
  dismissed,

  /// The platform can't tell.
  unknown,
}

/// Where the share popover points on iPad, in logical pixels.
final class ShareAnchor {
  const ShareAnchor({required this.left, required this.top, required this.width, required this.height});

  final double left;
  final double top;
  final double width;
  final double height;
}

/// A picked file, copied into the temporary folder (delete it when done).
final class PickedFile {
  const PickedFile({required this.name, required this.path, required this.sizeBytes});

  /// The name the user saw, e.g. `planyar-backup-2026-10-25-1730.zip`.
  final String name;
  final String path;
  final int sizeBytes;
}

final class FileTooLargeException implements Exception {
  const FileTooLargeException(this.limitBytes);

  final int limitBytes;

  @override
  String toString() => 'FileTooLargeException(limit: $limitBytes bytes)';
}
