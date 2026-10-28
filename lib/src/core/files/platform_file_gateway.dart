import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' show Rect;

import 'package:clock/clock.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'file_gateway.dart';

/// [FileGateway] over `path_provider`, `share_plus` and `file_picker`
/// (pinned to major 13; its API changes often). No storage permissions are
/// needed: the system picker and share sheet grant access (plan §8.11).
final class PlatformFileGateway implements FileGateway {
  const PlatformFileGateway();

  @override
  Future<String> temporaryDirectory() async => (await getTemporaryDirectory()).path;

  @override
  Future<String> supportDirectory() async => (await getApplicationSupportDirectory()).path;

  @override
  Future<String> documentsDirectory() async => (await getApplicationDocumentsDirectory()).path;

  @override
  Future<ShareOutcome> shareFiles(
    List<String> paths, {
    required String mimeType,
    String? subject,
    ShareAnchor? anchor,
  }) async {
    final result = await SharePlus.instance.share(
      ShareParams(
        files: [for (final path in paths) XFile(path, mimeType: mimeType)],
        subject: subject,
        sharePositionOrigin: anchor == null
            ? null
            : Rect.fromLTWH(anchor.left, anchor.top, anchor.width, anchor.height),
      ),
    );
    return switch (result.status) {
      ShareResultStatus.success => ShareOutcome.shared,
      ShareResultStatus.dismissed => ShareOutcome.dismissed,
      ShareResultStatus.unavailable => ShareOutcome.unknown,
    };
  }

  @override
  Future<bool> saveFile({required String fileName, required List<int> bytes, required String mimeType}) async {
    final saved = await FilePicker.saveFile(
      fileName: fileName,
      bytes: bytes is Uint8List ? bytes : Uint8List.fromList(bytes),
      mimeType: mimeType,
    );
    return saved != null;
  }

  @override
  Future<PickedFile?> pickFile({required int maxBytes}) async {
    final picked = await FilePicker.pickFile();
    if (picked == null) return null;
    final known = picked.lengthSync();
    if (known != null && known > maxBytes) throw FileTooLargeException(maxBytes);

    // Stream into our own temp copy, stopping at the limit: the picked URI
    // may be a content:// stream that can't be read twice.
    final copy = File('${await temporaryDirectory()}/import-${clock.now().microsecondsSinceEpoch}.bin');
    final sink = copy.openWrite();
    var size = 0;
    try {
      await for (final chunk in picked.readAsByteStream()) {
        size += chunk.length;
        if (size > maxBytes) throw FileTooLargeException(maxBytes);
        sink.add(chunk);
      }
      await sink.close();
    } on Object {
      await sink.close();
      if (copy.existsSync()) await copy.delete();
      rethrow;
    }
    return PickedFile(name: picked.name, path: copy.path, sizeBytes: size);
  }
}
