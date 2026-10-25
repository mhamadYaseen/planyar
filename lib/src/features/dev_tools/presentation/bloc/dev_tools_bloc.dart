import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/notification_spike_status.dart';
import '../../domain/usecases/notification_spike_usecases.dart';

part 'dev_tools_bloc.freezed.dart';
part 'dev_tools_event.dart';
part 'dev_tools_state.dart';

/// Drives the dev-flavor notification spike (plan §13 Phase 0).
class DevToolsBloc extends Bloc<DevToolsEvent, DevToolsState> {
  DevToolsBloc({
    required this._getStatus,
    required this._requestPermission,
    required this._showTest,
    required this._scheduleTest,
    required this._cancelTests,
  }) : super(const DevToolsState()) {
    on<_Started>((event, emit) => _refresh(emit));
    on<_PermissionRequested>(_onPermissionRequested);
    on<_ShowNowPressed>(_onShowNowPressed);
    on<_SchedulePressed>(_onSchedulePressed);
    on<_CancelAllPressed>(_onCancelAllPressed);
  }

  final GetNotificationSpikeStatus _getStatus;
  final RequestNotificationPermission _requestPermission;
  final ShowTestNotification _showTest;
  final ScheduleTestNotification _scheduleTest;
  final CancelTestNotifications _cancelTests;

  Future<void> _refresh(Emitter<DevToolsState> emit) async {
    if (state.status is! DataSuccess) emit(state.copyWith(status: const DataState.loading()));
    emit(state.copyWith(status: await _getStatus(const NoParams())));
  }

  Future<void> _onPermissionRequested(_PermissionRequested event, Emitter<DevToolsState> emit) async {
    final result = await _requestPermission(const NoParams());
    emit(state.copyWith(actionFailure: _failureOf(result)));
    await _refresh(emit);
  }

  Future<void> _onShowNowPressed(_ShowNowPressed event, Emitter<DevToolsState> emit) async {
    final result = await _showTest(event.text);
    emit(state.copyWith(actionFailure: _failureOf(result)));
  }

  Future<void> _onSchedulePressed(_SchedulePressed event, Emitter<DevToolsState> emit) async {
    final result = await _scheduleTest(ScheduleTestNotificationParams(text: event.text));
    emit(
      state.copyWith(
        lastScheduled: result is DataSuccess<ScheduledTestNotification> ? result.data : state.lastScheduled,
        actionFailure: _failureOf(result),
      ),
    );
    await _refresh(emit);
  }

  Future<void> _onCancelAllPressed(_CancelAllPressed event, Emitter<DevToolsState> emit) async {
    final result = await _cancelTests(const NoParams());
    emit(state.copyWith(lastScheduled: null, actionFailure: _failureOf(result)));
    await _refresh(emit);
  }

  static Failure? _failureOf(DataState<Object?> result) => switch (result) {
    DataError(:final failure) => failure,
    _ => null,
  };
}
