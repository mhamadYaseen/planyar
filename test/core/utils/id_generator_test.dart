import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/utils/id_generator.dart';

void main() {
  test('UUIDv7: lowercase canonical, version 7, unique and time-ordered (plan §7.4)', () {
    const generator = UuidV7IdGenerator();
    final ids = List.generate(500, (_) => generator.newId());
    final canonical = RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-7[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$');
    expect(
      ids.every(canonical.hasMatch),
      isTrue,
      reason: ids.firstWhere((id) => !canonical.hasMatch(id), orElse: () => ''),
    );
    expect(ids.toSet(), hasLength(ids.length));
    // The first 48 bits are a millisecond timestamp, so IDs never go backwards.
    final stamps = ids.map((id) => id.substring(0, 13)).toList();
    for (var i = 1; i < stamps.length; i++) {
      expect(stamps[i].compareTo(stamps[i - 1]), greaterThanOrEqualTo(0));
    }
  });
}
