import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/label_icons.dart';
import '../../../../app/theme/label_palette.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/dashed_border.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../labels/domain/entities/label.dart';
import '../../domain/entities/day_layout.dart';
import 'entry_semantics.dart';

/// One segment on the timeline (plan §12.3): actual = solid tint with a
/// strong left edge; planned = light tint with a dashed outline; open =
/// "No end" pill and Set end; overnight = continuation markers.
class EntryBlock extends StatelessWidget {
  const EntryBlock({
    required this.segment,
    required this.label,
    required this.height,
    required this.onTap,
    this.onSetEnd,
    super.key,
  });

  final TimelineSegment segment;
  final Label? label;

  /// Drawn height in logical pixels (the tap area may be taller).
  final double height;
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
    final textColor = planned ? tones.accent : tones.onBlock;
    final small = theme.textTheme.labelSmall?.copyWith(color: textColor);
    final icon = LabelIcons.of(label?.iconKey);
    final end = entry.end;

    // Content may be taller than a short block: it's clipped, never an
    // overflow error. The bottom marker stays pinned to the block's edge.
    final content = Stack(
      children: [
        Positioned.fill(
          child: ClipRect(
            child: OverflowBox(
              alignment: AlignmentDirectional.topStart,
              maxHeight: double.infinity,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 3, 4, 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (segment.continuesFromPreviousDay && height >= 44)
                      Text(
                        '↑ ${l10n.continuesFrom(time.dayAndTime(entry.start))}',
                        style: small,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    Row(
                      spacing: 4,
                      children: [
                        if (icon != null) Icon(icon, size: 14, color: textColor),
                        Expanded(
                          child: Text(
                            label?.name ?? l10n.unknownLabel,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelLarge?.copyWith(color: textColor),
                          ),
                        ),
                        if (segment.hasOverlap)
                          Icon(Icons.warning_amber_rounded, size: 16, color: PlanyarColors.of(context).warning),
                      ],
                    ),
                    if (height >= 40)
                      Text(
                        end == null ? time.time(entry.start) : time.range(entry.start, end),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: small?.copyWith(fontFeatures: const [FontFeature.tabularFigures()]),
                      ),
                    if (segment.isOpen && height >= 64)
                      Wrap(
                        spacing: 6,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          _Pill(text: l10n.noEnd, color: textColor),
                          if (onSetEnd != null)
                            TextButton(
                              onPressed: onSetEnd,
                              style: TextButton.styleFrom(
                                foregroundColor: textColor,
                                visualDensity: VisualDensity.compact,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                              ),
                              child: Text(l10n.setEnd),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (segment.continuesToNextDay && end != null && height >= 56)
          PositionedDirectional(
            start: 8,
            end: 4,
            bottom: 3,
            child: Text(
              '${l10n.continuesUntil(time.dayAndTime(end))} ↓',
              style: small,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );

    final Widget block = planned
        ? CustomPaint(
            foregroundPainter: DashedBorderPainter(color: tones.accent),
            child: DecoratedBox(
              decoration: BoxDecoration(color: tones.plannedFill, borderRadius: BorderRadius.circular(8)),
              child: content,
            ),
          )
        : DecoratedBox(
            decoration: BoxDecoration(
              color: tones.actualFill,
              borderRadius: BorderRadius.circular(8),
              border: BorderDirectional(start: BorderSide(color: tones.accent, width: 3)),
            ),
            child: segment.isOpen
                ? CustomPaint(
                    foregroundPainter: _OpenTailPainter(color: tones.accent),
                    child: content,
                  )
                : content,
          );

    return Semantics(
      button: true,
      label: entrySemanticsLabel(l10n: l10n, time: time, entry: entry, label: label, overlaps: segment.hasOverlap),
      excludeSemantics: true,
      onTap: onTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: height,
            width: double.infinity,
            child: ClipRRect(borderRadius: BorderRadius.circular(8), child: block),
          ),
        ),
      ),
    );
  }
}

/// Dashed bottom edge for an open entry's tail.
class _OpenTailPainter extends CustomPainter {
  const _OpenTailPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    for (var x = 0.0; x < size.width; x += 8) {
      canvas.drawLine(Offset(x, size.height - 1), Offset(x + 4, size.height - 1), paint);
    }
  }

  @override
  bool shouldRepaint(_OpenTailPainter old) => old.color != color;
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
    decoration: BoxDecoration(
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color)),
  );
}
