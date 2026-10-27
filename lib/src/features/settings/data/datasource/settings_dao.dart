import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables/settings_notifications.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin {
  SettingsDao(super.attachedDatabase);

  Stream<List<SettingRow>> watchAll() => select(settings).watch();

  Future<List<SettingRow>> all() => select(settings).get();

  Future<void> upsert(SettingsCompanion row) => into(settings).insertOnConflictUpdate(row);
}
