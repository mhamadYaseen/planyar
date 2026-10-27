import 'dart:math';

import '../../../../core/time/local_date.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../entries/domain/entities/entry_draft.dart';
import '../../../entries/domain/repositories/entries_repository.dart';
import '../../../labels/domain/repositories/labels_repository.dart';
import '../../../labels/domain/services/label_rules.dart';

/// Dev flavor only: fills the past [days] days with a realistic routine
/// (~7 entries a day) to check scrolling and query speed with 5,000 entries
/// (Phase 1 definition of done). Returns how many entries were added.
final class SeedSampleData implements UseCase<DataState<int>, int> {
  const SeedSampleData(this._entries, this._labels, this._timeZones);

  final EntriesRepository _entries;
  final LabelsRepository _labels;
  final TimeZoneService _timeZones;

  static const defaultDays = 770; // × ~6.5 entries a day ≈ 5,000

  @override
  Future<DataState<int>> call(int days) => guard(() async {
    final ids = await _labelIds(const {
      'Sleep': 'indigo',
      'Work': 'blue',
      'Meals': 'amber',
      'Exercise': 'green',
      'Study': 'teal',
    });
    final math = _timeZones.dayMath;
    final random = Random(42);
    final today = math.today();
    final drafts = <EntryDraft>[];

    void add(String label, LocalDate date, int startMinute, int endMinute, {EntryKind kind = EntryKind.actual}) {
      final jitter = kind == EntryKind.actual ? random.nextInt(21) - 10 : 0;
      final start = math.local(date, startMinute + jitter);
      final end = math.local(date, endMinute + jitter + random.nextInt(11));
      if (end > start) drafts.add(EntryDraft(kind: kind, labelId: ids[label]!, start: start, end: end));
    }

    for (var i = days; i >= 1; i--) {
      final date = today.addDays(-i);
      add('Sleep', date, -60, 7 * 60); // 23:00 the night before → 07:00
      add('Work', date, 9 * 60, 12 * 60 + 30);
      add('Meals', date, 12 * 60 + 30, 13 * 60 + 15);
      add('Work', date, 13 * 60 + 15, 17 * 60 + 30);
      if (i.isEven) add('Exercise', date, 18 * 60, 19 * 60);
      add('Study', date, 20 * 60, 21 * 60 + 30);
      add('Work', date, 9 * 60, 17 * 60 + 30, kind: EntryKind.planned);
    }
    return _entries.createMany(drafts);
  });

  Future<Map<String, String>> _labelIds(Map<String, String> wanted) async {
    final existing = {for (final l in await _labels.all()) l.nameKey: l.id};
    return {
      for (final MapEntry(key: name, value: color) in wanted.entries)
        name: existing[LabelRules.nameKeyOf(name)] ?? (await _labels.create(name: name, colorKey: color)).id,
    };
  }
}
