import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/time/minute_ticker.dart';
import '../../../../core/time/time_zone_service.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../entries/domain/usecases/entry_usecases.dart';

part 'today_bloc.freezed.dart';

@freezed
sealed class TodayEvent with _$TodayEvent {
  const factory TodayEvent.started() = _Started;

  /// From swiping, arrows, the week strip, the date picker or "Today".
  const factory TodayEvent.dateSelected(LocalDate date) = _DateSelected;
}

@freezed
abstract class TodayState with _$TodayState {
  const factory TodayState({
    required LocalDate today,
    required LocalDate selected,

    /// Open entries anywhere — the "◷ 2 to finish" chip (VIEW-05, §6.9).
    @Default(0) int openCount,
  }) = _TodayState;
}

/// The Today tab's navigation state (VIEW-02).
class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc({required this._watchOpen, required this._timeZones, required this._ticker})
    : super(TodayState(today: _timeZones.dayMath.today(), selected: _timeZones.dayMath.today())) {
    on<_Started>(_onStarted);
    on<_DateSelected>((event, emit) => emit(state.copyWith(selected: event.date)));
  }

  final WatchOpenEntries _watchOpen;
  final TimeZoneService _timeZones;
  final MinuteTicker _ticker;

  Future<void> _onStarted(_Started event, Emitter<TodayState> emit) => Future.wait([
    emit.onEach<List<Entry>>(
      _watchOpen(const NoParams()),
      onData: (open) => emit(state.copyWith(openCount: open.length)),
      onError: (_, _) {}, // The chip is optional; never break the page.
    ),
    // Keeps "today" right across midnight (DayChangeService, §8.4.3).
    emit.onEach<Instant>(_ticker.ticks(), onData: (now) => emit(state.copyWith(today: _timeZones.dayMath.dateOf(now)))),
  ]);
}
