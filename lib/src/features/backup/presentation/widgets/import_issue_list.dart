import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';

/// Issue or repair lines, capped so a file with thousands of bad records
/// stays responsive.
class ImportIssueList extends StatelessWidget {
  const ImportIssueList({required this.lines, super.key});

  final List<String> lines;

  static const _shown = 100;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final style = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final line in lines.take(_shown))
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 4),
              child: Text('• $line', style: style),
            ),
          if (lines.length > _shown) Text(l10n.importMoreIssues(lines.length - _shown), style: style),
        ],
      ),
    );
  }
}
