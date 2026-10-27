import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/label_palette.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/dashed_border.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../labels/domain/entities/label.dart';
import '../../../labels/presentation/widgets/label_visuals.dart';
import '../../domain/entities/day_layout.dart';
import 'entry_semantics.dart';

/// One entry in List mode (VIEW-01) — the fully accessible alternative to
/// the timeline (§8.7, §12.7).
class EntryListTile extends StatelessWidget {
  const EntryListTile({required this.segment, required this.label, required this.onTap, this.onSetEnd, super.key});

  final TimelineSegment segment;
  final Label? label;
  final VoidCallback onTap;
  final VoidCallback? onSetEnd;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final theme = Theme.of(context);
    final tones = LabelPalette.tonesForKey(label?.colorKey, theme.brightness);
    final entry = segment.entry;
    final planned = entry.kind == EntryKind.planned;
    final end = entry.end;
    final kindText = planned ? l10n.kindPlanned : l10n.kindActual;
    final timesText = end == null
        ? '$kindText · ${time.dayAndTime(entry.start)} · ${l10n.noEnd}'
        : '$kindText · ${time.range(entry.start, end)} · ${time.duration(end.difference(entry.start))}';

    final tile = ListTile(
      contentPadding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      leading: LabelAvatar(label: label),
      title: Row(
        spacing: 6,
        children: [
          Flexible(child: Text(label?.name ?? l10n.unknownLabel, overflow: TextOverflow.ellipsis)),
          if (segment.continuesFromPreviousDay || segment.continuesToNextDay)
            Icon(Icons.nightlight_outlined, size: 16, color: theme.colorScheme.onSurfaceVariant),
          if (segment.hasOverlap) Icon(Icons.warning_amber_rounded, size: 18, color: PlanyarColors.of(context).warning),
        ],
      ),
      subtitle: Text(timesText, style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()])),
      trailing: segment.isOpen && onSetEnd != null ? TextButton(onPressed: onSetEnd, child: Text(l10n.setEnd)) : null,
      onTap: onTap,
    );

    return Semantics(
      label: entrySemanticsLabel(l10n: l10n, time: time, entry: entry, label: label, overlaps: segment.hasOverlap),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 4),
        child: planned
            ? CustomPaint(
                foregroundPainter: DashedBorderPainter(color: tones.accent, radius: 12),
                child: Material(
                  color: tones.plannedFill,
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  child: tile,
                ),
              )
            : Material(
                color: theme.colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
                clipBehavior: Clip.antiAlias,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: BorderDirectional(start: BorderSide(color: tones.accent, width: 4)),
                  ),
                  child: tile,
                ),
              ),
      ),
    );
  }
}
