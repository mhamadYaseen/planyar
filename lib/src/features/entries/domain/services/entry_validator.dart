import '../../../../core/time/day_math.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';

/// Reasons an entry can't be saved (ENT-03, ENT-04).
enum EntryProblem { endNotAfterStart, longerThanSevenDays, startOutOfRange, notMinuteAligned, noteTooLong }

/// Non-blocking notes shown in the editor.
enum EntryNotice {
  /// Over 16 h: "Long entry — is the end time right?"
  longEntry,
}

final class EntryCheck {
  const EntryCheck({this.problems = const {}, this.notices = const {}});

  final Set<EntryProblem> problems;
  final Set<EntryNotice> notices;

  /// "Save first, refine later": only impossible data blocks a save.
  bool get canSave => problems.isEmpty;
}

/// Checks entry times and note before saving. Overlaps are warnings handled
/// by `OverlapDetector`, never problems.
final class EntryValidator {
  const EntryValidator(this._math);

  final DayMath _math;

  static const maxDuration = Duration(days: 7);
  static const longEntryThreshold = Duration(hours: 16);
  static const maxNoteLength = 2000;
  static final earliestDate = LocalDate(2000, 1, 1);
  static const yearsAhead = 5;

  /// [savedStart] is the start of the entry being edited: an unchanged start
  /// is never out of range, so an entry from an import or an old phone clock
  /// can still get a new note or label.
  EntryCheck check({required Instant start, Instant? end, String? note, required Instant now, Instant? savedStart}) {
    final problems = <EntryProblem>{};
    final notices = <EntryNotice>{};

    final latestDate = _math.dateOf(now).addYears(yearsAhead);
    final outOfRange = start < _math.startOfDay(earliestDate) || !start.isBefore(_math.dayBounds(latestDate).end);
    if (outOfRange && start != savedStart) problems.add(EntryProblem.startOutOfRange);
    if (!start.isMinuteAligned || (end != null && !end.isMinuteAligned)) {
      problems.add(EntryProblem.notMinuteAligned);
    }
    if (end != null) {
      final duration = end.difference(start);
      if (duration <= Duration.zero) {
        problems.add(EntryProblem.endNotAfterStart);
      } else if (duration > maxDuration) {
        problems.add(EntryProblem.longerThanSevenDays);
      } else if (duration > longEntryThreshold) {
        notices.add(EntryNotice.longEntry);
      }
    }
    if (note != null && note.length > maxNoteLength) problems.add(EntryProblem.noteTooLong);
    return EntryCheck(problems: problems, notices: notices);
  }
}
