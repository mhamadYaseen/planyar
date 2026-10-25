import 'package:flutter/services.dart' show appFlavor;

import 'flavors.dart';
import 'src/app/bootstrap.dart';

Future<void> main() async {
  F.appFlavor = Flavor.fromName(appFlavor);
  await bootstrap();
}
