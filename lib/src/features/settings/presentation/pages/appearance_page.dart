import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../domain/entities/app_settings.dart';
import '../bloc/app_settings_bloc.dart';

/// Appearance & time (S25): theme (SET-01) and first day of week (SET-02).
class AppearancePage extends StatelessWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final settings = context.watch<AppSettingsBloc>().state;
    final bloc = context.read<AppSettingsBloc>();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.appearanceAndTime)),
      body: ListView(
        children: [
          ListTile(title: Text(l10n.themeLabel, style: Theme.of(context).textTheme.titleSmall)),
          RadioGroup<AppThemeMode>(
            groupValue: settings.themeMode,
            onChanged: (mode) {
              if (mode != null) bloc.add(AppSettingsEvent.themeModeChanged(mode));
            },
            child: Column(
              children: [
                for (final (mode, text) in [
                  (AppThemeMode.system, l10n.themeSystem),
                  (AppThemeMode.light, l10n.themeLight),
                  (AppThemeMode.dark, l10n.themeDark),
                ])
                  RadioListTile<AppThemeMode>(value: mode, title: Text(text)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: DropdownButtonFormField<int>(
              initialValue: settings.firstDayOfWeek,
              decoration: InputDecoration(labelText: l10n.firstDayOfWeek),
              items: [
                for (var day = DateTime.monday; day <= DateTime.sunday; day++)
                  DropdownMenuItem(value: day, child: Text(time.weekdayName(day))),
              ],
              onChanged: (day) {
                if (day != null) bloc.add(AppSettingsEvent.firstDayOfWeekChanged(day));
              },
            ),
          ),
        ],
      ),
    );
  }
}
