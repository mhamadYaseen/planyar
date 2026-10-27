import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../domain/services/day_summary.dart';
import '../bloc/today_bloc.dart';

/// "⏱ 9 h 40 m tracked · 12 h planned" plus "⚠ 1 overlap" and
/// "◷ 2 to finish" chips (VIEW-05).
class DaySummaryBar extends StatelessWidget {
  const DaySummaryBar({required this.summary, this.onOverlapTap, super.key});

  final DaySummary summary;
  final VoidCallback? onOverlapTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final theme = Theme.of(context);
    final warning = PlanyarColors.of(context).warning;
    final openCount = context.select((TodayBloc b) => b.state.openCount);
    final totals = [
      l10n.trackedSummary(time.duration(summary.tracked)),
      if (summary.planned > Duration.zero) l10n.plannedSummary(time.duration(summary.planned)),
    ].join(' · ');
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 4,
        children: [
          // One rich text, so it wraps on narrow screens and large text.
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 6),
                    child: Icon(Icons.timer_outlined, size: 18, color: theme.colorScheme.onSurfaceVariant),
                  ),
                ),
                TextSpan(text: totals),
              ],
            ),
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          if (summary.overlapCount > 0)
            ActionChip(
              avatar: Icon(Icons.warning_amber_rounded, color: warning),
              label: Text(l10n.overlapChip(summary.overlapCount)),
              onPressed: onOverlapTap,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          if (openCount > 0)
            ActionChip(
              avatar: const Icon(Icons.timelapse),
              label: Text(l10n.toFinishChip(openCount)),
              onPressed: () => context.pushNamed(RouteNames.toFinish),
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
        ],
      ),
    );
  }
}
