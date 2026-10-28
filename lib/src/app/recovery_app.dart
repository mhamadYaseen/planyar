import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../config/localization/l10n/generated/app_localizations.dart';
import '../core/time/time_zone_service.dart';
import '../core/widgets/time_scope.dart';
import '../features/backup/presentation/bloc/recovery_bloc.dart';
import '../features/backup/presentation/pages/recovery_page.dart';
import 'theme/app_theme.dart';

/// Runs instead of the app when the database can't be opened (S28). It
/// needs nothing from dependency injection.
class RecoveryApp extends StatelessWidget {
  const RecoveryApp({
    required this.createBloc,
    required this.timeZones,
    required this.details,
    required this.onRetry,
    super.key,
  });

  final RecoveryBloc Function() createBloc;
  final TimeZoneService timeZones;
  final String details;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    localizationsDelegates: const [AppLocalizations.delegate, ...GlobalMaterialLocalizations.delegates],
    supportedLocales: AppLocalizations.supportedLocales,
    debugShowCheckedModeBanner: false,
    builder: (context, child) => TimeScope(timeZones: timeZones, child: child!),
    home: BlocProvider(
      create: (_) => createBloc(),
      child: RecoveryPage(details: details, onRetry: onRetry),
    ),
  );
}
