import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/time/local_date.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../settings/presentation/bloc/app_settings_bloc.dart';
import '../bloc/today_bloc.dart';

/// The week around the selected day, starting on the user's first day of
/// week (Friday by default, D-09). Tap a day to open it (VIEW-02).
class WeekStrip extends StatelessWidget {
  const WeekStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final time = TimeScope.of(context);
    final scheme = Theme.of(context).colorScheme;
    final goldInk = PlanyarColors.of(context).goldInk;
    final firstDay = context.select((AppSettingsBloc b) => b.state.firstDayOfWeek);
    return BlocBuilder<TodayBloc, TodayState>(
      builder: (context, state) {
        final weekStart = state.selected.startOfWeek(firstDay);
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
          child: Row(
            children: [
              for (var i = 0; i < 7; i++)
                Expanded(
                  child: _DayCell(
                    date: weekStart.addDays(i),
                    selected: weekStart.addDays(i) == state.selected,
                    isToday: weekStart.addDays(i) == state.today,
                    weekday: time.weekdayNarrow(weekStart.addDays(i)),
                    semantics: time.dayLong(weekStart.addDays(i)),
                    scheme: scheme,
                    goldInk: goldInk,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    required this.selected,
    required this.isToday,
    required this.weekday,
    required this.semantics,
    required this.scheme,
    required this.goldInk,
  });

  final LocalDate date;
  final bool selected;
  final bool isToday;
  final String weekday;
  final String semantics;
  final ColorScheme scheme;
  final Color goldInk;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics(
      button: true,
      selected: selected,
      label: semantics,
      excludeSemantics: true,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => context.read<TodayBloc>().add(TodayEvent.dateSelected(date)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56, minWidth: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weekday, style: textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant)),
              const SizedBox(height: 2),
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected ? scheme.primary : null,
                  border: isToday && !selected ? Border.all(color: goldInk, width: 1.5) : null,
                ),
                child: Text(
                  '${date.day}',
                  style: textTheme.labelLarge?.copyWith(
                    color: selected ? scheme.onPrimary : (isToday ? goldInk : scheme.onSurface),
                    fontWeight: isToday || selected ? FontWeight.w700 : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
