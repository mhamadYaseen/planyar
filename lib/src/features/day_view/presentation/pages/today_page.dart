import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/widgets/pickers.dart';
import '../../../../core/widgets/settings_button.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../entries/presentation/bloc/entry_actions_bloc.dart';
import '../../../entries/presentation/bloc/entry_form_bloc.dart';
import '../../../entries/presentation/entry_actions_ui.dart';
import '../../../settings/domain/entities/app_settings.dart';
import '../../../settings/presentation/bloc/app_settings_bloc.dart';
import '../bloc/today_bloc.dart';
import '../widgets/day_page.dart';
import '../widgets/week_strip.dart';

/// Today / Day view (S1): swipe between days, week strip, summary chips,
/// timeline or list, and + for quick add (VIEW-01…05, VIEW-07).
class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => sl<TodayBloc>()..add(const TodayEvent.started())),
      BlocProvider(create: (_) => sl<EntryActionsBloc>()),
    ],
    child: const EntryActionsListener(child: _TodayView()),
  );
}

class _TodayView extends StatefulWidget {
  const _TodayView();

  @override
  State<_TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<_TodayView> {
  // Page index = days since 1970-01-01, so a page maps straight to a date.
  late final _pages = PageController(initialPage: context.read<TodayBloc>().state.selected.epochDay);

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _select(LocalDate date) => context.read<TodayBloc>().add(TodayEvent.dateSelected(date));

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    return BlocListener<TodayBloc, TodayState>(
      listenWhen: (a, b) => a.selected != b.selected,
      listener: (context, state) {
        final current = _pages.hasClients ? _pages.page?.round() : null;
        final target = state.selected.epochDay;
        if (current == null || current == target) return;
        if ((current - target).abs() == 1) {
          _pages.animateToPage(target, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
        } else {
          _pages.jumpToPage(target);
        }
      },
      child: BlocBuilder<TodayBloc, TodayState>(
        builder: (context, state) {
          final selected = state.selected;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                tooltip: l10n.previousDay,
                icon: const Icon(Icons.chevron_left),
                onPressed: () => _select(selected.addDays(-1)),
              ),
              titleSpacing: 0,
              title: Semantics(
                label: '${time.dayLong(selected)}. ${l10n.pickDate}',
                excludeSemantics: true,
                button: true,
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onSurface),
                  onPressed: () async {
                    final picked = await pickLocalDate(context, initial: selected, today: state.today);
                    if (picked != null) _select(picked);
                  },
                  child: Text(time.day(selected), style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              actions: [
                IconButton(
                  tooltip: l10n.nextDay,
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _select(selected.addDays(1)),
                ),
                if (selected != state.today)
                  IconButton(
                    tooltip: l10n.goToToday,
                    icon: const Icon(Icons.today_outlined),
                    onPressed: () => _select(state.today),
                  ),
                const _ViewMenu(),
                const SettingsButton(),
              ],
            ),
            body: Column(
              children: [
                const WeekStrip(),
                Expanded(
                  child: PageView.builder(
                    controller: _pages,
                    onPageChanged: (index) => _select(LocalDate.fromEpochDay(index)),
                    itemBuilder: (context, index) => DayPage(key: ValueKey(index), date: LocalDate.fromEpochDay(index)),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: l10n.addEntry,
              onPressed: () => openEntryFormWithUndo(context, NewEntryOnDate(selected)),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

enum _MenuAction { timeline, list, split, combined }

/// Timeline / List (VIEW-01) and lane mode (VIEW-03), both remembered.
class _ViewMenu extends StatelessWidget {
  const _ViewMenu();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = context.watch<AppSettingsBloc>().state;
    final bloc = context.read<AppSettingsBloc>();
    return PopupMenuButton<_MenuAction>(
      tooltip: settings.dayViewMode == DayViewMode.timeline ? l10n.showAsList : l10n.showAsTimeline,
      icon: Icon(
        settings.dayViewMode == DayViewMode.timeline ? Icons.view_timeline_outlined : Icons.view_list_outlined,
      ),
      onSelected: (action) => bloc.add(switch (action) {
        _MenuAction.timeline => const AppSettingsEvent.dayViewModeChanged(DayViewMode.timeline),
        _MenuAction.list => const AppSettingsEvent.dayViewModeChanged(DayViewMode.list),
        _MenuAction.split => const AppSettingsEvent.laneModeChanged(LaneMode.split),
        _MenuAction.combined => const AppSettingsEvent.laneModeChanged(LaneMode.combined),
      }),
      itemBuilder: (context) => [
        CheckedPopupMenuItem(
          value: _MenuAction.timeline,
          checked: settings.dayViewMode == DayViewMode.timeline,
          child: Text(l10n.showAsTimeline),
        ),
        CheckedPopupMenuItem(
          value: _MenuAction.list,
          checked: settings.dayViewMode == DayViewMode.list,
          child: Text(l10n.showAsList),
        ),
        const PopupMenuDivider(),
        CheckedPopupMenuItem(
          value: _MenuAction.split,
          checked: settings.laneMode == LaneMode.split,
          child: Text(l10n.lanesSplit),
        ),
        CheckedPopupMenuItem(
          value: _MenuAction.combined,
          checked: settings.laneMode == LaneMode.combined,
          child: Text(l10n.lanesCombined),
        ),
      ],
    );
  }
}
