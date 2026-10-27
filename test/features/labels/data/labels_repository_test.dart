// Labels and categories repositories (LBL-01…05, CAT-01, CAT-04).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/database/app_database.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/entries/data/datasource/entries_dao.dart';
import 'package:planyar/src/features/entries/data/repositories/entries_repository_impl.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/labels/data/datasource/labels_dao.dart';
import 'package:planyar/src/features/labels/data/repositories/labels_repository_impl.dart';
import 'package:planyar/src/features/labels/domain/entities/label.dart';
import 'package:planyar/src/features/labels/domain/repositories/labels_repository.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/test_database.dart';

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late AppDatabase db;
  late LabelsRepositoryImpl labels;
  late CategoriesRepositoryImpl categories;
  late EntriesRepositoryImpl entries;

  setUp(() async {
    db = newTestDatabase();
    final ids = SequentialIds();
    labels = LabelsRepositoryImpl(LabelsDao(db), ids);
    categories = CategoriesRepositoryImpl(LabelsDao(db), ids);
    entries = EntriesRepositoryImpl(EntriesDao(db), ids, await baghdadTimeZones());
  });

  tearDown(() => db.close());

  Future<Entry> logWith(String labelId) => entries.create(
    EntryDraft(kind: EntryKind.actual, labelId: labelId, start: Instant.parse('2026-10-25T10:00:00Z')),
  );

  test('create cleans the name and auto-assigns unused colors (LBL-01)', () async {
    final a = await labels.create(name: '  Deep   work ');
    final b = await labels.create(name: 'Study');
    expect((a.name, a.nameKey, a.colorKey), ('Deep work', 'deep work', 'teal'));
    expect(b.colorKey, 'indigo');
    expect((await labels.create(name: 'Rose', colorKey: 'rose')).colorKey, 'rose');
  });

  test('names are unique ignoring case and spaces, archived included (LBL-02, LBL-05)', () async {
    final study = await labels.create(name: 'Study');
    expect(() => labels.create(name: '  STUDY '), throwsA(isA<NameTakenException>()));
    await labels.setArchived(study.id, archived: true);
    expect(() => labels.create(name: 'study'), throwsA(isA<NameTakenException>()));
  });

  test('J20: rename shows everywhere — entries keep the same label ID', () async {
    final study = await labels.create(name: 'Study');
    final entry = await logWith(study.id);
    final renamed = await labels.update(study.copyWith(name: 'Deep work'));
    expect((renamed.name, renamed.nameKey), ('Deep work', 'deep work'));
    expect((await entries.byId(entry.id))!.labelId, study.id);
    final other = await labels.create(name: 'Work');
    expect(() => labels.update(other.copyWith(name: 'deep WORK')), throwsA(isA<NameTakenException>()));
  });

  test('J20: in-use labels cannot be deleted; unused ones can (LBL-04)', () async {
    final used = await labels.create(name: 'Study');
    final unused = await labels.create(name: 'Chess');
    await logWith(used.id);
    expect(await labels.usage(used.id), const LabelUsage(entries: 1));
    expect(() => labels.delete(used.id), throwsA(isA<LabelInUseException>()));
    await labels.delete(unused.id);
    expect(await labels.byId(unused.id), isNull);
  });

  test('archive and restore (LBL-05)', () async {
    final study = await labels.create(name: 'Study');
    expect((await labels.setArchived(study.id, archived: true)).isArchived, isTrue);
    expect((await labels.setArchived(study.id, archived: false)).isArchived, isFalse);
  });

  test('entry counts per label stream (S5)', () async {
    final a = await labels.create(name: 'A');
    await logWith(a.id);
    await logWith(a.id);
    expect(await labels.watchEntryCounts().first, {a.id: 2});
  });

  test('categories: unique names; delete moves labels and overrides (CAT-04)', () async {
    final learning = await categories.create(name: 'Learning');
    final health = await categories.create(name: 'Health');
    expect(() => categories.create(name: ' learning'), throwsA(isA<NameTakenException>()));
    final study = await labels.create(name: 'Study', categoryId: learning.id);
    final override = await entries.create(
      EntryDraft(
        kind: EntryKind.actual,
        labelId: study.id,
        start: Instant.parse('2026-10-25T10:00:00Z'),
        categoryOverrideId: learning.id,
      ),
    );
    expect((await categories.usage(learning.id)).labels, 1);

    await categories.delete(learning.id, moveTo: health.id);
    expect((await labels.byId(study.id))!.categoryId, health.id);
    expect((await entries.byId(override.id))!.categoryOverrideId, health.id);
    expect((await categories.all()).map((c) => c.name), ['Health']);

    await categories.delete(health.id);
    expect((await labels.byId(study.id))!.categoryId, isNull);
  });
}
