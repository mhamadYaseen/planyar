// EntryValidator (ENT-03, ENT-04). "Now" is Sun 25 Oct 2026 14:20 Baghdad.
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/day_math.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/tz_time_zone_rules.dart';
import 'package:planyar/src/features/entries/domain/services/entry_validator.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

Instant at(String local) => Instant.parse('$local+03:00');

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late EntryValidator validator;
  final now = at('2026-10-25T14:20:00');

  setUp(() => validator = EntryValidator(DayMath(TzTimeZoneRules.named('Asia/Baghdad'))));

  EntryCheck check(String start, {String? end, String? note}) =>
      validator.check(start: at(start), end: end == null ? null : at(end), note: note, now: now);

  test('a normal entry and an open entry are fine', () {
    expect(check('2026-10-25T14:00:00', end: '2026-10-25T16:00:00').canSave, isTrue);
    expect(check('2026-10-25T14:00:00').canSave, isTrue);
  });

  test('end must be after start', () {
    expect(check('2026-10-25T14:00:00', end: '2026-10-25T14:00:00').problems, {EntryProblem.endNotAfterStart});
    expect(check('2026-10-25T14:00:00', end: '2026-10-25T13:00:00').problems, {EntryProblem.endNotAfterStart});
  });

  test('over 16 h is allowed with a notice; over 7 days is blocked (D-33)', () {
    final long = check('2026-10-24T20:00:00', end: '2026-10-25T13:00:00');
    expect(long.canSave, isTrue);
    expect(long.notices, {EntryNotice.longEntry});
    expect(check('2026-10-25T00:00:00', end: '2026-10-25T16:00:00').notices, isEmpty);
    expect(check('2026-10-18T14:00:00', end: '2026-10-25T14:00:00').canSave, isTrue);
    expect(check('2026-10-18T14:00:00', end: '2026-10-25T14:01:00').problems, {EntryProblem.longerThanSevenDays});
  });

  test('dates from 2000-01-01 to five years ahead (ENT-03)', () {
    expect(check('2000-01-01T00:00:00', end: '2000-01-01T01:00:00').canSave, isTrue);
    expect(check('1999-12-31T23:00:00', end: '2000-01-01T01:00:00').problems, {EntryProblem.startOutOfRange});
    expect(check('2031-10-25T22:00:00', end: '2031-10-25T23:00:00').canSave, isTrue);
    expect(check('2031-10-26T00:00:00', end: '2031-10-26T01:00:00').problems, {EntryProblem.startOutOfRange});
  });

  test('minute precision (ENT-03)', () {
    expect(check('2026-10-25T14:00:30').problems, {EntryProblem.notMinuteAligned});
  });

  test('notes up to 2,000 characters', () {
    expect(check('2026-10-25T14:00:00', note: 'x' * 2000).canSave, isTrue);
    expect(check('2026-10-25T14:00:00', note: 'x' * 2001).problems, {EntryProblem.noteTooLong});
  });
}
