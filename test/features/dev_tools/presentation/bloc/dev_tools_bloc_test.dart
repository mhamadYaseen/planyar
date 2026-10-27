import 'package:bloc_test/bloc_test.dart';
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/error/failures.dart';
import 'package:planyar/src/core/notifications/notification_gateway.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/time_zone_service.dart';
import 'package:planyar/src/core/time/wall_time.dart';
import 'package:planyar/src/core/utils/data_state.dart';
import 'package:planyar/src/features/dev_tools/domain/entities/notification_spike_status.dart';
import 'package:planyar/src/features/dev_tools/domain/usecases/notification_spike_usecases.dart';
import 'package:planyar/src/features/dev_tools/presentation/bloc/dev_tools_bloc.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../../helpers/fake_notification_gateway.dart';

void main() {
  late FakeNotificationGateway gateway;
  late TimeZoneService timeZones;
  const text = TestNotificationText(title: 'Test', body: 'Body');
  final now = DateTime.utc(2026, 10, 25, 11, 30);

  setUpAll(tzdata.initializeTimeZones);

  setUp(() async {
    gateway = FakeNotificationGateway();
    timeZones = TimeZoneService(() async => 'Asia/Baghdad');
    // As at app startup; otherwise DayMath falls back to the machine's zone.
    await timeZones.refresh();
  });

  DevToolsBloc build() => DevToolsBloc(
    getStatus: GetNotificationSpikeStatus(gateway, timeZones),
    requestPermission: RequestNotificationPermission(gateway),
    showTest: ShowTestNotification(gateway),
    scheduleTest: ScheduleTestNotification(gateway, timeZones),
    cancelTests: CancelTestNotifications(gateway),
  );

  NotificationSpikeStatus status({bool allowed = false, int pending = 0}) => NotificationSpikeStatus(
    permissions: NotificationPermissions(notificationsAllowed: allowed, exactAlarmsAllowed: true),
    timeZoneId: 'Asia/Baghdad',
    pendingCount: pending,
  );

  blocTest<DevToolsBloc, DevToolsState>(
    'started loads permissions, zone and pending count',
    build: build,
    act: (bloc) => bloc.add(const DevToolsEvent.started()),
    expect: () => [
      const DevToolsState(status: DataState.loading()),
      DevToolsState(status: DataState.success(status())),
    ],
  );

  blocTest<DevToolsBloc, DevToolsState>(
    'permission request refreshes the status',
    build: build,
    act: (bloc) => bloc.add(const DevToolsEvent.permissionRequested()),
    verify: (bloc) => expect(bloc.state, DevToolsState(status: DataState.success(status(allowed: true)))),
  );

  blocTest<DevToolsBloc, DevToolsState>(
    'scheduling sets a reminder one minute ahead and shows its local time',
    // A Bloc handles events in the zone it was created in, so the fixed
    // clock must wrap creation.
    build: () => withClock(Clock.fixed(now), build),
    act: (bloc) => bloc.add(const DevToolsEvent.schedulePressed(text)),
    verify: (bloc) {
      final at = Instant.fromDateTime(now) + const Duration(minutes: 1);
      expect(gateway.scheduled.single.at, at);
      expect(gateway.scheduled.single.channel, NotificationChannel.routines);
      expect(bloc.state.lastScheduled, ScheduledTestNotification(at: at, localTime: WallTime(14, 31)));
      expect(bloc.state.status, DataState.success(status(pending: 1)));
    },
  );

  blocTest<DevToolsBloc, DevToolsState>(
    'a platform error becomes a failure instead of a crash',
    build: () {
      gateway.throwOnSchedule = StateError('exact alarms revoked');
      return build();
    },
    act: (bloc) => bloc.add(const DevToolsEvent.schedulePressed(text)),
    verify: (bloc) {
      expect(bloc.state.actionFailure, isA<PlatformFailure>());
      expect(bloc.state.lastScheduled, isNull);
    },
  );

  blocTest<DevToolsBloc, DevToolsState>(
    'cancel clears pending notifications',
    build: build,
    act: (bloc) async {
      bloc.add(const DevToolsEvent.schedulePressed(text));
      await Future<void>.delayed(Duration.zero);
      bloc.add(const DevToolsEvent.cancelAllPressed());
    },
    verify: (bloc) {
      expect(gateway.scheduled, isEmpty);
      expect(bloc.state.lastScheduled, isNull);
      expect(bloc.state.status, DataState.success(status()));
    },
  );
}
