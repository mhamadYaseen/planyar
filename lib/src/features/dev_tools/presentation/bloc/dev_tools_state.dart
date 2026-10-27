part of 'dev_tools_bloc.dart';

@freezed
abstract class DevToolsState with _$DevToolsState {
  const factory DevToolsState({
    @Default(DataState<NotificationSpikeStatus>.initial()) DataState<NotificationSpikeStatus> status,

    /// The last scheduled test reminder.
    ScheduledTestNotification? lastScheduled,

    /// Sample data: loading while seeding, then the number added.
    @Default(DataState<int>.initial()) DataState<int> seed,

    /// The last action's failure, shown once in a snackbar.
    Failure? actionFailure,
  }) = _DevToolsState;
}
