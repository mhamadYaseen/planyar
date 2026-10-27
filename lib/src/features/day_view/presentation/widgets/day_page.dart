import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../entries/presentation/bloc/entry_form_bloc.dart';
import '../../../entries/presentation/entry_actions_ui.dart';
import '../../../settings/domain/entities/app_settings.dart';
import '../../../settings/presentation/bloc/app_settings_bloc.dart';
import '../bloc/day_view_bloc.dart';
import '../bloc/today_bloc.dart';
import 'day_list.dart';
import 'day_summary_bar.dart';
import 'day_timeline.dart';

/// One date in the Today pager: summary bar + timeline or list.
class DayPage extends StatelessWidget {
  const DayPage({required this.date, super.key});

  final LocalDate date;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) =>
        sl<DayViewBloc>(param1: date, param2: context.read<AppSettingsBloc>().state.laneMode)
          ..add(const DayViewEvent.started()),
    child: const _DayPageBody(),
  );
}

class _DayPageBody extends StatefulWidget {
  const _DayPageBody();

  @override
  State<_DayPageBody> createState() => _DayPageBodyState();
}

class _DayPageBodyState extends State<_DayPageBody> {
  final _timeline = GlobalKey<DayTimelineState>();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final mode = context.select((AppSettingsBloc b) => b.state.dayViewMode);
    final laneMode = context.select((AppSettingsBloc b) => b.state.laneMode);
    final today = context.select((TodayBloc b) => b.state.today);
    final largeText = MediaQuery.textScalerOf(context).scale(10) >= 15;

    return BlocListener<AppSettingsBloc, AppSettings>(
      listenWhen: (a, b) => a.laneMode != b.laneMode,
      listener: (context, s) => context.read<DayViewBloc>().add(DayViewEvent.laneModeChanged(s.laneMode)),
      child: BlocBuilder<DayViewBloc, DayViewState>(
        builder: (context, state) {
          final view = switch (state.view) {
            DataSuccess(:final data) => data,
            _ => null,
          };
          if (state.view is DataError) return Center(child: Text(l10n.errorGeneric));
          if (view == null) return const Center(child: CircularProgressIndicator());
          final isEmpty = view.layout.segments.isEmpty;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DaySummaryBar(summary: view.summary, onOverlapTap: () => _timeline.currentState?.scrollToFirstOverlap()),
              if (largeText && mode == DayViewMode.timeline)
                _LargeTextHint(
                  onSwitch: () =>
                      context.read<AppSettingsBloc>().add(const AppSettingsEvent.dayViewModeChanged(DayViewMode.list)),
                ),
              Expanded(
                child: mode == DayViewMode.list && isEmpty
                    ? EmptyView(
                        icon: Icons.wb_sunny_outlined,
                        message: state.date == today ? l10n.todayEmpty : l10n.dayEmptyOtherDay,
                      )
                    : mode == DayViewMode.list
                    ? DayList(
                        view: view,
                        onEntryTap: (e) => openEntryFormWithUndo(context, EditEntry(e.id)),
                        onSetEnd: (e) => chooseEntryEnd(context, e),
                      )
                    : DayTimeline(
                        key: _timeline,
                        view: view,
                        laneMode: laneMode,
                        onEntryTap: (e) => openEntryFormWithUndo(context, EditEntry(e.id)),
                        onSetEnd: (e) => chooseEntryEnd(context, e),
                        onGapTap: (gap, kind) => openEntryFormWithUndo(context, NewEntryInGap(gap, kind: kind)),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// At ≥ 150% text, suggest List mode (§12.7).
class _LargeTextHint extends StatelessWidget {
  const _LargeTextHint({required this.onSwitch});

  final VoidCallback onSwitch;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: Text(l10n.largeTextHint, style: Theme.of(context).textTheme.bodySmall)),
          TextButton(onPressed: onSwitch, child: Text(l10n.showAsList)),
        ],
      ),
    );
  }
}
