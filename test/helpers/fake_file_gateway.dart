import 'dart:io';

import 'package:planyar/src/core/files/file_gateway.dart';

/// A [FileGateway] over real temporary folders, with scripted share, save
/// and pick results. Call [dispose] in `tearDown`.
class FakeFileGateway implements FileGateway {
  FakeFileGateway() : root = Directory.systemTemp.createTempSync('planyar_files_');

  final Directory root;

  /// What [shareFiles] returns.
  ShareOutcome shareOutcome = ShareOutcome.shared;

  /// What [saveFile] returns.
  bool saveResult = true;

  /// The file [pickFile] "picks" (copied like the real gateway); null cancels.
  File? fileToPick;

  /// Thrown by [shareFiles] / [saveFile] when set.
  Object? throwOnShare;

  final shared = <List<String>>[];

  /// Copies of what was shared or saved, taken at call time (the real
  /// share sheet copies the file too).
  final sharedBytes = <List<int>>[];
  final saved = <({String fileName, List<int> bytes})>[];

  String get _temp => (Directory('${root.path}/tmp')..createSync(recursive: true)).path;

  @override
  Future<String> temporaryDirectory() async => _temp;

  @override
  Future<String> supportDirectory() async => (Directory('${root.path}/support')..createSync(recursive: true)).path;

  @override
  Future<String> documentsDirectory() async => (Directory('${root.path}/documents')..createSync(recursive: true)).path;

  @override
  Future<ShareOutcome> shareFiles(
    List<String> paths, {
    required String mimeType,
    String? subject,
    ShareAnchor? anchor,
  }) async {
    if (throwOnShare case final error?) throw error;
    shared.add(paths);
    for (final path in paths) {
      sharedBytes.add(File(path).readAsBytesSync());
    }
    return shareOutcome;
  }

  @override
  Future<bool> saveFile({required String fileName, required List<int> bytes, required String mimeType}) async {
    if (throwOnShare case final error?) throw error;
    if (saveResult) saved.add((fileName: fileName, bytes: bytes));
    return saveResult;
  }

  @override
  Future<PickedFile?> pickFile({required int maxBytes}) async {
    final source = fileToPick;
    if (source == null) return null;
    final size = source.lengthSync();
    if (size > maxBytes) throw FileTooLargeException(maxBytes);
    final copy = source.copySync('$_temp/import-${shared.length}-${DateTime.now().microsecondsSinceEpoch}.bin');
    return PickedFile(name: source.uri.pathSegments.last, path: copy.path, sizeBytes: size);
  }

  /// Files currently in the temporary folder.
  List<String> get temporaryFiles => [for (final f in Directory(_temp).listSync()) f.uri.pathSegments.last];

  void dispose() {
    if (root.existsSync()) root.deleteSync(recursive: true);
  }
}
