import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

/// SET-01.
enum AppThemeMode { system, light, dark }

/// Day view mode (VIEW-01), remembered.
enum DayViewMode { timeline, list }

/// Timeline lanes (VIEW-03, D-32).
enum LaneMode {
  /// Plan | Actual side by side (default).
  split,

  /// One lane with both kinds.
  combined,
}

/// App-wide settings stored in the `settings` table (plan §8.5, §10.4).
@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppThemeMode.system) AppThemeMode themeMode,

    /// `DateTime.monday` … `DateTime.sunday`; Friday by default (D-09).
    @Default(DateTime.friday) int firstDayOfWeek,
    @Default(DayViewMode.timeline) DayViewMode dayViewMode,
    @Default(LaneMode.split) LaneMode laneMode,

    /// Device-only: never exported (§10.4).
    @Default(false) bool onboardingCompleted,
  }) = _AppSettings;
}
