// Clean-architecture guard (plan §8.3, §8.12). Fails when:
// * a domain file or pure core engine imports Flutter, Drift or a plugin;
// * domain imports data or presentation, or data imports presentation.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Packages that tie code to Flutter, the database or the platform.
const _forbiddenInPureCode = [
  'dart:ui',
  'package:flutter/',
  'package:flutter_test/',
  'package:material_ui/',
  'package:cupertino_ui/',
  'package:drift',
  'package:sqlite3',
  'package:flutter_bloc/',
  'package:get_it/',
  'package:go_router/',
  'package:flutter_local_notifications/',
  'package:flutter_timezone/',
  'package:path_provider/',
  'package:share_plus/',
  'package:file_picker/',
  'package:printing/',
  'package:fl_chart/',
];

/// Core folders that hold pure Dart engines and value types.
const _pureCoreDirs = ['lib/src/core/time', 'lib/src/core/error', 'lib/src/core/usecases', 'lib/src/core/utils'];

/// Pure interface files that live next to their plugin implementations.
const _pureCoreFiles = ['lib/src/core/notifications/notification_gateway.dart'];

final _importPattern = RegExp(r'''^\s*(?:import|export)\s+['"]([^'"]+)['"]''', multiLine: true);

List<File> _dartFiles(String dir) => Directory(dir).existsSync()
    ? Directory(dir)
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.dart') && !f.path.endsWith('.g.dart') && !f.path.endsWith('.freezed.dart'))
          .toList()
    : <File>[];

Iterable<String> _imports(File file) => _importPattern.allMatches(file.readAsStringSync()).map((m) => m.group(1)!);

List<File> _layerFiles(String layer) => [
  for (final feature in Directory('lib/src/features').listSync().whereType<Directory>())
    ..._dartFiles('${feature.path}/$layer'),
];

void main() {
  test('domain code and pure core engines import no Flutter, Drift or plugins', () {
    final files = [
      ..._layerFiles('domain'),
      for (final dir in _pureCoreDirs) ..._dartFiles(dir),
      ..._pureCoreFiles.map(File.new),
    ];
    expect(files, isNotEmpty);
    final violations = [
      for (final file in files)
        for (final import in _imports(file))
          if (_forbiddenInPureCode.any(import.startsWith)) '${file.path} imports $import',
    ];
    expect(violations, isEmpty, reason: violations.join('\n'));
  });

  test('dependencies point inwards: presentation → domain ← data', () {
    final violations = [
      for (final file in _layerFiles('domain'))
        for (final import in _imports(file))
          if (import.contains('/data/') || import.contains('/presentation/')) '${file.path} imports $import',
      for (final file in _layerFiles('data'))
        for (final import in _imports(file))
          if (import.contains('/presentation/')) '${file.path} imports $import',
    ];
    expect(violations, isEmpty, reason: violations.join('\n'));
  });
}
