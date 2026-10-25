/// A calendar date with no time zone, e.g. `2026-10-25` (plan §6.1).
///
/// Used for task dates, routine starts/ends on, occurrence dates and
/// exception dates. Stored as ISO text `YYYY-MM-DD`. Internally it keeps the
/// day number since 1970-01-01 so comparisons and day arithmetic are cheap.
final class LocalDate implements Comparable<LocalDate> {
  /// Throws [ArgumentError] if the date doesn't exist (e.g. 2026-02-29) or
  /// the year is outside 1…9999.
  factory LocalDate(int year, int month, int day) {
    if (year < 1 || year > 9999) {
      throw ArgumentError.value(year, 'year', 'must be 1…9999');
    }
    if (month < 1 || month > 12) {
      throw ArgumentError.value(month, 'month', 'must be 1…12');
    }
    if (day < 1 || day > daysInMonth(year, month)) {
      throw ArgumentError.value(day, 'day', 'is not a day of $year-$month');
    }
    final epochDay = DateTime.utc(year, month, day).millisecondsSinceEpoch ~/ _msPerDay;
    return LocalDate._(year, month, day, epochDay);
  }

  /// The date [epochDay] days after 1970-01-01 (negative = before).
  factory LocalDate.fromEpochDay(int epochDay) {
    final dt = DateTime.fromMillisecondsSinceEpoch(epochDay * _msPerDay, isUtc: true);
    return LocalDate(dt.year, dt.month, dt.day);
  }

  const LocalDate._(this.year, this.month, this.day, this.epochDay);

  /// Parses strict `YYYY-MM-DD`. Throws [FormatException] otherwise.
  factory LocalDate.parse(String text) {
    final date = tryParse(text);
    if (date == null) throw FormatException('Not a YYYY-MM-DD date', text);
    return date;
  }

  /// Parses strict `YYYY-MM-DD`, or returns null.
  static LocalDate? tryParse(String text) {
    final match = _isoPattern.firstMatch(text);
    if (match == null) return null;
    final year = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final day = int.parse(match.group(3)!);
    if (year < 1 || month < 1 || month > 12 || day < 1 || day > daysInMonth(year, month)) {
      return null;
    }
    return LocalDate(year, month, day);
  }

  static final _isoPattern = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$');
  static const _msPerDay = Duration.millisecondsPerDay;

  final int year;
  final int month;
  final int day;

  /// Days since 1970-01-01.
  final int epochDay;

  /// [DateTime.monday] (1) … [DateTime.sunday] (7).
  int get weekday => (epochDay + 3) % 7 + 1; // 1970-01-01 was a Thursday.

  LocalDate addDays(int days) => days == 0 ? this : LocalDate.fromEpochDay(epochDay + days);

  /// Adds calendar months, clamping to the month's last day
  /// (31 Jan + 1 month = 28/29 Feb).
  LocalDate addMonths(int months) {
    if (months == 0) return this;
    final total = year * 12 + (month - 1) + months;
    final y = total ~/ 12;
    final m = total % 12 + 1;
    final last = daysInMonth(y, m);
    return LocalDate(y, m, day > last ? last : day);
  }

  /// Adds calendar years, clamping 29 Feb to 28 Feb in common years.
  LocalDate addYears(int years) => addMonths(years * 12);

  /// Whole days from this date to [other] (negative if [other] is earlier).
  int daysUntil(LocalDate other) => other.epochDay - epochDay;

  /// The first date of the week containing this date, for a week that starts
  /// on [firstWeekday] ([DateTime.monday] … [DateTime.sunday]).
  LocalDate startOfWeek(int firstWeekday) {
    if (firstWeekday < DateTime.monday || firstWeekday > DateTime.sunday) {
      throw ArgumentError.value(firstWeekday, 'firstWeekday', 'must be 1…7');
    }
    return addDays(-((weekday - firstWeekday) % 7));
  }

  bool isBefore(LocalDate other) => epochDay < other.epochDay;
  bool isAfter(LocalDate other) => epochDay > other.epochDay;
  bool operator <(LocalDate other) => epochDay < other.epochDay;
  bool operator <=(LocalDate other) => epochDay <= other.epochDay;
  bool operator >(LocalDate other) => epochDay > other.epochDay;
  bool operator >=(LocalDate other) => epochDay >= other.epochDay;

  @override
  int compareTo(LocalDate other) => epochDay.compareTo(other.epochDay);

  @override
  bool operator ==(Object other) => other is LocalDate && other.epochDay == epochDay;

  @override
  int get hashCode => epochDay.hashCode;

  /// ISO `YYYY-MM-DD`.
  String toIso() =>
      '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}';

  @override
  String toString() => toIso();

  static bool isLeapYear(int year) => (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;

  static int daysInMonth(int year, int month) => switch (month) {
    2 => isLeapYear(year) ? 29 : 28,
    4 || 6 || 9 || 11 => 30,
    _ => 31,
  };
}
