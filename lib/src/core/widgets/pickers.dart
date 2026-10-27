import 'package:material_ui/material_ui.dart';

import '../time/local_date.dart';
import '../time/wall_time.dart';

/// Material date picker returning a [LocalDate] (ENT-03 range: 2000 → +5 y).
Future<LocalDate?> pickLocalDate(BuildContext context, {required LocalDate initial, required LocalDate today}) async {
  // DateTime here only carries calendar fields for the picker; no zone math.
  final picked = await showDatePicker(
    context: context,
    initialDate: DateTime(initial.year, initial.month, initial.day),
    firstDate: DateTime(2000),
    lastDate: DateTime(today.year + 5, today.month, today.day),
  );
  return picked == null ? null : LocalDate(picked.year, picked.month, picked.day);
}

/// Material time picker returning a [WallTime]; follows the device 12/24 h setting.
Future<WallTime?> pickWallTime(BuildContext context, {required WallTime initial}) async {
  final picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: initial.hour, minute: initial.minute),
  );
  return picked == null ? null : WallTime(picked.hour, picked.minute);
}
