// AppInfo.version is shown in About and written into backup manifests; it
// must match pubspec.yaml (bump both together).
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/app_info.dart';

void main() {
  test('AppInfo.version matches pubspec.yaml', () {
    final line = File('pubspec.yaml').readAsLinesSync().firstWhere((l) => l.startsWith('version:'));
    expect(AppInfo.version, line.substring('version:'.length).trim());
  });
}
