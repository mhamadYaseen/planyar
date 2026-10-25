import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

import '../../flavors.dart';
import '../core/di/injection.dart';
import 'app.dart';
import 'routes/app_router.dart';
import 'startup_failure_app.dart';

/// Startup order (plan §8.4.4): binding → database → dependencies →
/// time zone and notifications → runApp.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await setupDependencies(flavor: F.appFlavor);
  } on Object catch (error, stack) {
    // Never crash or delete data on a bad start; show what happened.
    // Phase 2 replaces this with the full Recovery screen (S28).
    if (kDebugMode) debugPrint('Startup failed: $error\n$stack');
    runApp(StartupFailureApp(details: error.toString()));
    return;
  }
  runApp(PlanyarApp(router: sl<AppRouter>().router));
}
