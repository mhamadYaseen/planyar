import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../config/localization/l10n/generated/app_localizations.dart';
import '../time/day_math.dart';
import '../time/instant.dart';
import '../time/local_date.dart';
import '../time/time_zone_service.dart';
import '../time/wall_time.dart';

/// Gives widgets local-time conversion (the device zone's `DayMath`) and
/// formatting that follows the device's 12/24-hour setting (D-29).
class TimeScope extends InheritedWidget {
  const TimeScope({required this.timeZones, required super.child, super.key});

  final TimeZoneService timeZones;

  static TimeFormat of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<TimeScope>();
    assert(scope != null, 'No TimeScope above this widget');
    return TimeFormat(
      math: scope!.timeZones.dayMath,
      locale: Localizations.localeOf(context).toString(),
      use24h: MediaQuery.alwaysUse24HourFormatOf(context),
      l10n: AppLocalizations.of(context),
    );
  }

  @override
  bool updateShouldNotify(TimeScope oldWidget) => timeZones != oldWidget.timeZones;
}

/// Times, dates and durations as shown in the app (plan §12.4).
final class TimeFormat {
  TimeFormat({required this.math, required this.locale, required this.use24h, required this.l10n});

  final DayMath math;
  final String locale;
  final bool use24h;
  final AppLocalizations l10n;

  late final _wall = DateFormat(use24h ? 'HH:mm' : 'h:mm a', locale);
  late final _hour = DateFormat(use24h ? 'HH:mm' : 'h a', locale);
  late final _day = DateFormat('EEE d MMM', locale);
  late final _dayLong = DateFormat('EEEE d MMMM', locale);
  late final _weekdayNarrow = DateFormat('EEEEE', locale);
  late final _weekdayLong = DateFormat('EEEE', locale);
  late final _weekdayShort = DateFormat('EEE', locale);

  // Formatting only: UTC fields hold the wall-clock values, no zone math.
  static DateTime _fields(LocalDate d, [WallTime? t]) =>
      DateTime.utc(d.year, d.month, d.day, t?.hour ?? 0, t?.minute ?? 0);

  LocalDate today() => math.today();

  LocalDate dateOf(Instant instant) => math.dateOf(instant);

  /// "14:05" or "2:05 PM".
  String wall(WallTime time) => _wall.format(_fields(LocalDate(2000, 1, 1), time));

  String time(Instant instant) => wall(math.wallTimeOf(instant));

  /// Timeline hour labels: "14:00" or the compact "2 PM".
  String hourLabel(WallTime time) => _hour.format(_fields(LocalDate(2000, 1, 1), time));

  /// Adds "(2nd)" for the second pass through a fall-back hour (§6.4).
  String timeMarked(Instant instant) =>
      math.isRepeatedWallTime(instant) ? l10n.repeatedHour(time(instant)) : time(instant);

  /// "Sun 25 Oct".
  String day(LocalDate date) => _day.format(_fields(date));

  /// "Sunday 25 October".
  String dayLong(LocalDate date) => _dayLong.format(_fields(date));

  /// "S" — week strip.
  String weekdayNarrow(LocalDate date) => _weekdayNarrow.format(_fields(date));

  /// "Sun".
  String weekdayShort(LocalDate date) => _weekdayShort.format(_fields(date));

  /// "Friday" for `DateTime.friday`.
  String weekdayName(int weekday) => _weekdayLong.format(_fields(LocalDate(2024, 1, weekday)));

  /// "Sun 14:05".
  String dayAndTime(Instant instant) => '${weekdayShort(math.dateOf(instant))} ${time(instant)}';

  /// "14:00–17:00" on one day; "Sat 23:00 → Sun 07:00" across midnight.
  String range(Instant start, Instant end) {
    final sameDay = math.dateOf(start) == math.dateOf(end - const Duration(milliseconds: 1));
    return sameDay ? '${time(start)}–${time(end)}' : '${dayAndTime(start)} → ${dayAndTime(end)}';
  }

  /// "2 h 05 m", "8 h", "45 m" (plan §12.4).
  String duration(Duration d) {
    final total = d.inMinutes;
    final hours = total ~/ 60;
    final minutes = total % 60;
    if (hours == 0) return l10n.durationMinutes('$minutes');
    if (minutes == 0) return l10n.durationHours('$hours');
    return l10n.durationHoursMinutes('$hours', minutes.toString().padLeft(2, '0'));
  }
}
