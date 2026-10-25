import 'package:drift/drift.dart';

import '../time/instant.dart';
import '../time/local_date.dart';

/// Instants are stored as UTC epoch milliseconds (plan §6.1, §7.1).
final class InstantConverter extends TypeConverter<Instant, int> {
  const InstantConverter();

  @override
  Instant fromSql(int fromDb) => Instant.fromUtcMs(fromDb);

  @override
  int toSql(Instant value) => value.utcMs;
}

/// Local dates are stored as ISO text `YYYY-MM-DD` (plan §6.1).
final class LocalDateConverter extends TypeConverter<LocalDate, String> {
  const LocalDateConverter();

  @override
  LocalDate fromSql(String fromDb) => LocalDate.parse(fromDb);

  @override
  String toSql(LocalDate value) => value.toIso();
}
