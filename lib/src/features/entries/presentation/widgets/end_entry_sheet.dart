import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/time/instant.dart';
import '../../../../core/widgets/pickers.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../domain/entities/entry.dart';

/// Quick ends for an open entry: End now, +30m / +1h / +2h from the start,
/// Set end… (ENT-05, J2 AC3). Returns the chosen end.
Future<Instant?> showEndEntrySheet(BuildContext context, Entry entry) => showModalBottomSheet<Instant>(
  context: context,
  builder: (context) => SafeArea(
    child: EndEntryOptions(entry: entry, onEnd: (end) => Navigator.of(context).pop(end)),
  ),
);

/// The end options as a row of buttons (also used inline on To finish).
class EndEntryOptions extends StatelessWidget {
  const EndEntryOptions({required this.entry, required this.onEnd, super.key});

  final Entry entry;
  final ValueChanged<Instant> onEnd;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final now = Instant.now().floorToMinute();
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          if (now > entry.start) FilledButton(onPressed: () => onEnd(now), child: Text(l10n.endNow)),
          for (final (label, duration) in [
            (l10n.plus30m, const Duration(minutes: 30)),
            (l10n.plus1h, const Duration(hours: 1)),
            (l10n.plus2h, const Duration(hours: 2)),
          ])
            OutlinedButton(onPressed: () => onEnd(entry.start + duration), child: Text(label)),
          TextButton(
            onPressed: () async {
              final startDate = time.dateOf(entry.start);
              final picked = await pickWallTime(
                context,
                initial: time.math.wallTimeOf(now > entry.start ? now : entry.start),
              );
              if (picked == null) return;
              final sameDay = time.math.at(startDate, picked);
              onEnd(sameDay > entry.start ? sameDay : time.math.at(startDate.addDays(1), picked));
            },
            child: Text(l10n.setEndEllipsis),
          ),
        ],
      ),
    );
  }
}
