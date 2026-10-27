import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/core/utils/id_generator.dart';

/// A fresh in-memory database (foreign keys on, as in the app).
AppDatabase newTestDatabase() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  return AppDatabase(NativeDatabase.memory());
}

/// A Baghdad TimeZoneService; call `initializeTimeZones()` first.
Future<TimeZoneService> baghdadTimeZones() async {
  final service = TimeZoneService(() async => 'Asia/Baghdad');
  await service.refresh();
  return service;
}

/// Predictable IDs: id-1, id-2, …
class SequentialIds implements IdGenerator {
  var _next = 0;

  @override
  String newId() => 'id-${++_next}';
}
