import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/usecases/settings_usecases.dart';

part 'app_settings_bloc.freezed.dart';

@freezed
sealed class AppSettingsEvent with _$AppSettingsEvent {
  const factory AppSettingsEvent.started() = _Started;
  const factory AppSettingsEvent.themeModeChanged(AppThemeMode mode) = _ThemeModeChanged;
  const factory AppSettingsEvent.firstDayOfWeekChanged(int weekday) = _FirstDayChanged;
  const factory AppSettingsEvent.dayViewModeChanged(DayViewMode mode) = _DayViewModeChanged;
  const factory AppSettingsEvent.laneModeChanged(LaneMode mode) = _LaneModeChanged;
}

/// App-wide settings (plan §8.4.1). Seeded at startup with the stored
/// values, so the first frame already has the right theme and route.
class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettings> {
  AppSettingsBloc({required AppSettings initial, required this._watch, required this._update}) : super(initial) {
    on<_Started>((event, emit) => emit.forEach(_watch(const NoParams()), onData: (settings) => settings));
    on<_ThemeModeChanged>((event, emit) => _change((s) => s.copyWith(themeMode: event.mode)));
    on<_FirstDayChanged>((event, emit) => _change((s) => s.copyWith(firstDayOfWeek: event.weekday)));
    on<_DayViewModeChanged>((event, emit) => _change((s) => s.copyWith(dayViewMode: event.mode)));
    on<_LaneModeChanged>((event, emit) => _change((s) => s.copyWith(laneMode: event.mode)));
  }

  final WatchSettings _watch;
  final UpdateSettings _update;

  // The watch stream delivers the saved value back into the state.
  Future<void> _change(AppSettings Function(AppSettings) change) => _update(change);
}
