import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/files/safety_backup_store.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/features/backup/data/repositories/backup_files_repository_impl.dart';
import 'package:planyar/src/features/backup/domain/usecases/backup_usecases.dart';
import 'package:planyar/src/features/day_view/domain/usecases/day_usecases.dart';
import 'package:planyar/src/features/entries/data/datasource/entries_dao.dart';
import 'package:planyar/src/features/entries/data/repositories/entries_repository_impl.dart';
import 'package:planyar/src/features/entries/domain/usecases/entry_usecases.dart';
import 'package:planyar/src/features/entries/presentation/bloc/entry_actions_bloc.dart';
import 'package:planyar/src/features/entries/presentation/bloc/entry_form_bloc.dart';
import 'package:planyar/src/features/labels/data/datasource/labels_dao.dart';
import 'package:planyar/src/features/labels/data/repositories/labels_repository_impl.dart';
import 'package:planyar/src/features/labels/domain/usecases/label_usecases.dart';
import 'package:planyar/src/features/labels/presentation/bloc/label_editor_bloc.dart';
import 'package:planyar/src/features/labels/presentation/bloc/label_picker_bloc.dart';
import 'package:planyar/src/features/onboarding/domain/usecases/onboarding_usecases.dart';
import 'package:planyar/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:planyar/src/features/settings/data/datasource/settings_dao.dart';
import 'package:planyar/src/features/settings/data/repositories/settings_repository_impl.dart';

import 'fake_file_gateway.dart';
import 'test_database.dart';

/// Real repositories and use cases over an in-memory database (Baghdad).
/// Call `initializeTimeZones()` in `setUpAll` first.
class TestDeps {
  TestDeps._(this.db, this.zones);

  static Future<TestDeps> create() async => TestDeps._(newTestDatabase(), await baghdadTimeZones());

  final AppDatabase db;
  final TimeZoneService zones;
  final ids = SequentialIds();
  final files = FakeFileGateway();

  late final entries = EntriesRepositoryImpl(EntriesDao(db), ids, zones);
  late final labels = LabelsRepositoryImpl(LabelsDao(db), ids);
  late final categories = CategoriesRepositoryImpl(LabelsDao(db), ids);
  late final settings = SettingsRepositoryImpl(SettingsDao(db));

  late final saveEntry = SaveEntry(entries, zones);
  late final watchDay = WatchDayEntries(entries, labels, zones);

  EntryFormBloc entryForm() => EntryFormBloc(
    getDefaults: GetEntryDefaults(entries, zones),
    getPlannedDuration: GetPlannedDuration(entries),
    getEntry: GetEntry(entries),
    findOverlaps: FindOverlaps(entries),
    save: saveEntry,
    delete: DeleteEntry(entries),
    watchLabels: WatchLabels(labels),
    recentUse: GetRecentLabelUse(entries),
    watchCategories: WatchCategories(categories),
    timeZones: zones,
  );

  EntryActionsBloc entryActions() => EntryActionsBloc(
    setEnd: SetEntryEnd(saveEntry),
    delete: DeleteEntry(entries),
    restore: RestoreEntry(entries),
    revert: RevertEntry(entries),
  );

  LabelPickerBloc labelPicker() => LabelPickerBloc(
    watchLabels: WatchLabels(labels),
    recentUse: GetRecentLabelUse(entries),
    create: CreateLabel(labels),
    setArchived: SetLabelArchived(labels),
  );

  LabelEditorBloc labelEditor() => LabelEditorBloc(
    labels: labels,
    categories: WatchCategories(categories),
    create: CreateLabel(labels),
    update: UpdateLabel(labels),
    setArchived: SetLabelArchived(labels),
    delete: DeleteLabel(labels),
    usage: GetLabelUsage(labels),
  );

  OnboardingBloc onboarding() => OnboardingBloc(
    FinishOnboarding(labels, categories, settings),
    PickBackupFile(
      BackupFilesRepositoryImpl(
        files: files,
        safety: SafetyBackupStore(files.supportDirectory),
        timeZones: zones,
        appVersion: '1.0.0+1',
        dbSchemaVersion: AppDatabase.currentSchemaVersion,
        platform: 'android',
      ),
    ),
  );

  Future<void> close() async {
    await db.close();
    files.dispose();
  }
}
