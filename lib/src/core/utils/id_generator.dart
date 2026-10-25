import 'package:uuid/uuid.dart';

/// Creates record IDs (plan §7.4). Only repositories call this, never widgets.
abstract interface class IdGenerator {
  /// A lowercase canonical UUID string (36 characters).
  String newId();
}

/// Time-ordered UUIDv7 IDs, for good index locality.
final class UuidV7IdGenerator implements IdGenerator {
  const UuidV7IdGenerator();

  static const _uuid = Uuid();

  @override
  String newId() => _uuid.v7();
}
