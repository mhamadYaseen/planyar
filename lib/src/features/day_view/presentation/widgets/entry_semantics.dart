import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../entries/domain/entities/entry.dart';
import '../../../labels/domain/entities/label.dart';

/// "Actual. Study. 14:00 to 16:00. 2 hours." (plan §12.3).
String entrySemanticsLabel({
  required AppLocalizations l10n,
  required TimeFormat time,
  required Entry entry,
  required Label? label,
  bool overlaps = false,
}) {
  final kind = entry.kind == EntryKind.actual ? l10n.kindActual : l10n.kindPlanned;
  final name = label?.name ?? l10n.unknownLabel;
  final end = entry.end;
  final base = end == null
      ? l10n.openEntrySemantics(kind, name, time.dayAndTime(entry.start))
      : l10n.entrySemantics(
          kind,
          name,
          time.dayAndTime(entry.start),
          time.dayAndTime(end),
          time.duration(end.difference(entry.start)),
        );
  return overlaps ? '$base ${l10n.overlapSemantics}' : base;
}
