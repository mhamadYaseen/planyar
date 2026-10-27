import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../domain/entities/day_layout.dart';
import '../bloc/day_view_bloc.dart';
import 'entry_block.dart';

/// The day timeline (plan §8.7): hour grid, Plan | Actual lanes, overlap
/// columns, overnight markers, open-entry tails, now-line and gap taps.
class DayTimeline extends StatefulWidget {
  const DayTimeline({
    required this.view,
    required this.laneMode,
    required this.onEntryTap,
    required this.onSetEnd,
    required this.onGapTap,
    super.key,
  });

  final DayView view;
  final LaneMode laneMode;
  final ValueChanged<Entry> onEntryTap;
  final ValueChanged<Entry> onSetEnd;

  /// The tapped gap and, in split mode, the lane's kind (ENT-11).
  final void Function(InstantRange gap, EntryKind? laneKind) onGapTap;

  @override
  State<DayTimeline> createState() => DayTimelineState();
}

class DayTimelineState extends State<DayTimeline> {
  final _scroll = ScrollController();
  double _hourHeight = 56;

  static const _baseHourHeight = 56.0;
  static const _minTapHeight = 48.0;
  static const _rightPadding = 8.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _jumpTo(_initialMinute()));
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  /// Today: now minus two hours; other days: the first entry; else 07:00 (VIEW-07).
  int _initialMinute() {
    final layout = widget.view.layout;
    if (layout.nowMinute case final now?) return now - 120;
    if (layout.segments.isNotEmpty) return layout.segments.first.startMinute - 60;
    return 7 * 60;
  }

  void _jumpTo(int minute) {
    if (!_scroll.hasClients) return;
    final offset = (minute / 60 * _hourHeight).clamp(0.0, _scroll.position.maxScrollExtent);
    _scroll.jumpTo(offset);
  }

  /// Scrolls to the first overlapping block (the "⚠ 1 overlap" chip).
  void scrollToFirstOverlap() {
    final first = widget.view.layout.segments.where((s) => s.hasOverlap).firstOrNull;
    if (first == null || !_scroll.hasClients) return;
    final offset = ((first.startMinute - 30) / 60 * _hourHeight).clamp(0.0, _scroll.position.maxScrollExtent);
    _scroll.animateTo(offset, duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final theme = Theme.of(context);
    final scaler = MediaQuery.textScalerOf(context);
    final layout = widget.view.layout;
    final split = widget.laneMode == LaneMode.split;
    _hourHeight = scaler.scale(_baseHourHeight).clamp(_baseHourHeight, _baseHourHeight * 2);
    final gutter = scaler.scale(52).clamp(52.0, 96.0);
    final totalHeight = layout.totalMinutes / 60 * _hourHeight;
    double y(int minute) => minute / 60 * _hourHeight;

    return Column(
      children: [
        if (split)
          Padding(
            padding: EdgeInsetsDirectional.only(start: gutter, end: _rightPadding),
            child: Row(
              children: [
                for (final title in [l10n.lanePlan, l10n.laneActual])
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
                      child: Text(
                        title,
                        style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        Expanded(
          child: SingleChildScrollView(
            controller: _scroll,
            child: SizedBox(
              height: totalHeight + 24,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final lanesWidth = constraints.maxWidth - gutter - _rightPadding;
                  final laneWidth = split ? lanesWidth / 2 : lanesWidth;
                  double laneStart(TimelineLane lane) => gutter + (lane == TimelineLane.actual ? laneWidth : 0);

                  return Stack(
                    children: [
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _GridPainter(
                            hourOffsets: [for (final h in layout.hours) y(h.minute)],
                            gutter: gutter,
                            laneDivider: split ? gutter + laneWidth : null,
                            rightPadding: _rightPadding,
                            line: theme.colorScheme.outlineVariant,
                          ),
                        ),
                      ),
                      for (final hour in layout.hours)
                        PositionedDirectional(
                          top: y(hour.minute) - 8,
                          start: 0,
                          width: gutter - 8,
                          child: Text(
                            hour.isRepeated
                                ? l10n.repeatedHour(time.hourLabel(hour.wallTime))
                                : time.hourLabel(hour.wallTime),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFeatures: const [FontFeature.tabularFigures()],
                            ),
                          ),
                        ),
                      // Taps on empty space create an entry for that gap (ENT-11).
                      // A touch shortcut for the + button, so hidden from screen readers.
                      PositionedDirectional(
                        start: gutter,
                        end: _rightPadding,
                        top: 0,
                        height: totalHeight,
                        child: GestureDetector(
                          excludeFromSemantics: true,
                          behavior: HitTestBehavior.opaque,
                          onTapUp: (details) => _onGapTap(details.localPosition, laneWidth, split, layout),
                        ),
                      ),
                      for (final segment in layout.segments)
                        _positioned(segment, laneStart(segment.lane), laneWidth, y),
                      if (layout.nowMinute case final now?)
                        PositionedDirectional(
                          top: y(now) - 1,
                          start: gutter - 6,
                          end: 0,
                          child: IgnorePointer(child: _NowLine(color: theme.colorScheme.error)),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _positioned(TimelineSegment segment, double laneStart, double laneWidth, double Function(int) y) {
    final columnWidth = laneWidth / segment.columnCount;
    final height = (y(segment.endMinute) - y(segment.startMinute)).clamp(4.0, double.infinity);
    return PositionedDirectional(
      top: y(segment.startMinute),
      start: laneStart + segment.column * columnWidth + 2,
      width: columnWidth - 4,
      // Short blocks get a 48 dp tap area below their drawn height (§12.7).
      height: height < _minTapHeight ? _minTapHeight : height,
      child: EntryBlock(
        segment: segment,
        label: widget.view.labels[segment.entry.labelId],
        height: height,
        onTap: () => widget.onEntryTap(segment.entry),
        onSetEnd: segment.isOpen ? () => widget.onSetEnd(segment.entry) : null,
      ),
    );
  }

  /// The empty stretch around the tap in that lane; long gaps become a
  /// one-hour slot starting at the tapped quarter hour.
  void _onGapTap(Offset position, double laneWidth, bool split, DayLayout layout) {
    final lane = !split
        ? TimelineLane.combined
        : (Directionality.of(context) == TextDirection.rtl) == (position.dx > laneWidth)
        ? TimelineLane.plan
        : TimelineLane.actual;
    final minute = (position.dy / _hourHeight * 60).floor().clamp(0, layout.totalMinutes - 1);
    final inLane = layout.segments.where((s) => s.lane == lane);
    var gapStart = 0;
    var gapEnd = layout.totalMinutes;
    for (final s in inLane) {
      if (s.endMinute <= minute && s.endMinute > gapStart) gapStart = s.endMinute;
      if (s.startMinute > minute && s.startMinute < gapEnd) gapEnd = s.startMinute;
      if (s.startMinute <= minute && s.endMinute > minute) return; // inside a block
    }
    if (gapEnd - gapStart > 120) {
      gapStart = (minute ~/ 15 * 15).clamp(gapStart, gapEnd);
      gapEnd = (gapStart + 60).clamp(gapStart + 1, gapEnd);
    }
    final start = layout.bounds.start + Duration(minutes: gapStart);
    final end = layout.bounds.start + Duration(minutes: gapEnd);
    widget.onGapTap(InstantRange(start, end), switch (lane) {
      TimelineLane.plan => EntryKind.planned,
      TimelineLane.actual => EntryKind.actual,
      TimelineLane.combined => null,
    });
  }
}

class _GridPainter extends CustomPainter {
  const _GridPainter({
    required this.hourOffsets,
    required this.gutter,
    required this.laneDivider,
    required this.rightPadding,
    required this.line,
  });

  final List<double> hourOffsets;
  final double gutter;
  final double? laneDivider;
  final double rightPadding;
  final Color line;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = line
      ..strokeWidth = 1;
    for (final y in hourOffsets) {
      canvas.drawLine(Offset(gutter, y), Offset(size.width - rightPadding, y), paint);
    }
    if (laneDivider case final x?) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.hourOffsets != hourOffsets || old.gutter != gutter || old.laneDivider != laneDivider || old.line != line;
}

/// The current-time line on today's timeline (VIEW-07).
class _NowLine extends StatelessWidget {
  const _NowLine({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Expanded(child: Container(height: 2, color: color)),
    ],
  );
}
