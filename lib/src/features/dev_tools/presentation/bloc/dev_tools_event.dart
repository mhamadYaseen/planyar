part of 'dev_tools_bloc.dart';

@freezed
sealed class DevToolsEvent with _$DevToolsEvent {
  /// Load permission state, zone and pending count.
  const factory DevToolsEvent.started() = _Started;

  /// Ask the OS for notification permission.
  const factory DevToolsEvent.permissionRequested() = _PermissionRequested;

  const factory DevToolsEvent.showNowPressed(TestNotificationText text) = _ShowNowPressed;

  /// Schedule a test reminder one minute from now.
  const factory DevToolsEvent.schedulePressed(TestNotificationText text) = _SchedulePressed;

  const factory DevToolsEvent.cancelAllPressed() = _CancelAllPressed;
}
