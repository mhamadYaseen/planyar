import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/time/minute_ticker.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/utils/data_state.dart';
import '../../../labels/domain/entities/label.dart';
import '../../domain/entities/day_layout.dart';
import '../../domain/services/day_summary.dart';
import '../../domain/services/timeline_layout.dart';
import '../../domain/usecases/day_usecases.dart';

part 'day_view_bloc.freezed.dart';

/// What one day page draws.
final class DayView {
  const DayView({required this.layout, required this.summary, required this.labels});

  final DayLayout layout;
  final DaySummary summary;
  final Map<String, Label> labels;
}

@freezed
sealed class DayViewEvent with _$DayViewEvent {
  const factory DayViewEvent.started() = _Started;
  const factory DayViewEvent.laneModeChanged(LaneMode mode) = _LaneModeChanged;
}

@freezed
abstract class DayViewState with _$DayViewState {
  const factory DayViewState({
    required LocalDate date,
    required LaneMode laneMode,
    @Default(DataState<DayView>.loading()) DataState<DayView> view,
  }) = _DayViewState;
}

/// One per visible date (plan §8.4.1): live entries → timeline model.
/// Re-lays out every minute so open-entry tails follow "now".
class DayViewBloc extends Bloc<DayViewEvent, DayViewState> {
  DayViewBloc({
    required LocalDate date,
    required LaneMode laneMode,
    required this._watchDay,
    required this._timeZones,
    required this._ticker,
  }) : super(DayViewState(date: date, laneMode: laneMode)) {
    on<_Started>(_onStarted);
    on<_LaneModeChanged>((event, emit) {
      emit(state.copyWith(laneMode: event.mode));
      _relayout(emit);
    });
  }

  final WatchDayEntries _watchDay;
  final TimeZoneService _timeZones;
  final MinuteTicker _ticker;
  DayEntries? _latest;

  Future<void> _onStarted(_Started event, Emitter<DayViewState> emit) => Future.wait([
    emit.onEach<DayEntries>(
      _watchDay(state.date),
      onData: (day) {
        _latest = day;
        _relayout(emit);
      },
      onError: (error, _) => emit(state.copyWith(view: DataState.error(Failure.database(error.toString())))),
    ),
    emit.onEach<Instant>(_ticker.ticks(), onData: (_) => _relayout(emit)),
  ]);

  void _relayout(Emitter<DayViewState> emit) {
    final day = _latest;
    if (day == null) return;
    final layout = TimelineLayout(_timeZones.dayMath)
        .build(date: state.date, entries: day.entries, now: Instant.now(), laneMode: state.laneMode);
    emit(
      state.copyWith(
        view: DataState.success(
          DayView(
            layout: layout,
            summary: DaySummary.of(day: layout.bounds, entries: day.entries),
            labels: day.labels,
          ),
        ),
      ),
    );
  }
}
