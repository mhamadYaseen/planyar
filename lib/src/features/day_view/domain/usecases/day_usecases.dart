import '../../../../core/time/local_date.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/streams.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../entries/domain/repositories/entries_repository.dart';
import '../../../labels/domain/entities/label.dart';
import '../../../labels/domain/repositories/labels_repository.dart';

/// A day's entries plus every label (archived included, so history still
/// shows its names — J20 AC3).
final class DayEntries {
  const DayEntries({required this.entries, required this.labels});

  final List<Entry> entries;
  final Map<String, Label> labels;
}

/// Live entries for one local date (plan §8.4.2 `watchDay`).
final class WatchDayEntries implements StreamUseCase<DayEntries, LocalDate> {
  const WatchDayEntries(this._entries, this._labels, this._timeZones);

  final EntriesRepository _entries;
  final LabelsRepository _labels;
  final TimeZoneService _timeZones;

  @override
  Stream<DayEntries> call(LocalDate date) => combineLatest2(
    _entries.watchRange(_timeZones.dayMath.dayBounds(date)),
    _labels.watchAll(),
    (entries, labels) => DayEntries(entries: entries, labels: {for (final l in labels) l.id: l}),
  );
}

/// Open entries with their labels (To finish, S11; the header chip).
final class WatchOpenEntriesWithLabels implements StreamUseCase<DayEntries, NoParams> {
  const WatchOpenEntriesWithLabels(this._entries, this._labels);

  final EntriesRepository _entries;
  final LabelsRepository _labels;

  @override
  Stream<DayEntries> call(NoParams params) => combineLatest2(
    _entries.watchOpen(),
    _labels.watchAll(),
    (entries, labels) => DayEntries(entries: entries, labels: {for (final l in labels) l.id: l}),
  );
}
