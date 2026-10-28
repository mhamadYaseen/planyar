import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../domain/entities/backup_records.dart';
import '../../domain/entities/import_plan.dart';
import 'backup_texts.dart';

/// Per record type: new / updated / unchanged / left out … (J16 AC1).
/// Types with nothing to report are hidden.
class ImportCountsView extends StatelessWidget {
  const ImportCountsView({required this.summary, super.key});

  final ImportSummary summary;

  /// What people look for first.
  static const _order = [
    BackupTable.entries,
    BackupTable.labels,
    BackupTable.categories,
    BackupTable.routines,
    BackupTable.routineExceptions,
    BackupTable.tasks,
    BackupTable.taskSeries,
    BackupTable.taskReminders,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rows = <(BackupTable, List<String>)>[];
    for (final table in _order) {
      final t = summary.of(table);
      final parts = summary.mode == ImportMode.replace
          ? [
              if (t.added > 0) l10n.countNew(t.added),
              if (t.overwritten > 0) l10n.countUpdated(t.overwritten),
              if (t.unchanged > 0) l10n.countUnchanged(t.unchanged),
              if (t.removed > 0) l10n.countRemoved(t.removed),
              if (t.invalid > 0) l10n.countInvalid(t.invalid),
            ]
          : [
              if (t.added > 0) l10n.countNew(t.added),
              if (t.overwritten > 0) l10n.countUpdated(t.overwritten),
              if (t.unchanged > 0) l10n.countUnchanged(t.unchanged),
              if (t.matchedByName > 0) l10n.countMatchedByName(t.matchedByName),
              if (t.duplicates > 0) l10n.countDuplicates(t.duplicates),
              if (t.replacedByKey > 0) l10n.countReplacedByKey(t.replacedByKey),
              if (t.invalid > 0) l10n.countInvalid(t.invalid),
            ];
      if (parts.isNotEmpty) rows.add((table, parts));
    }
    return Column(
      children: [
        for (final (table, parts) in rows)
          ListTile(dense: true, title: Text(l10n.tableName(table)), subtitle: Text(parts.join(' · '))),
      ],
    );
  }
}
