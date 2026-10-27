// EntryFormBloc with real repositories (ENT-01…ENT-12; J1, J2, J5).
// "Now" is Sun 25 Oct 2026 14:22:40 Baghdad (+03:00).
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/error/failures.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/core/time/local_date.dart';
import 'package:planyar/src/core/time/wall_time.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/entries/domain/services/entry_validator.dart';
import 'package:planyar/src/features/entries/presentation/bloc/entry_form_bloc.dart';
import 'package:planyar/src/features/labels/domain/entities/label.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/test_deps.dart';

Instant at(String local) => Instant.parse('$local+03:00');
final now = DateTime.parse('2026-10-25T14:22:40+03:00');
final today = LocalDate(2026, 10, 25);

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late TestDeps deps;
  late Label work;
  late Label study;

  setUp(() async {
    deps = await TestDeps.create();
    work = await deps.labels.create(name: 'Work');
    study = await deps.labels.create(name: 'Study');
  });
  tearDown(() => deps.close());

  /// Runs [body] with the clock fixed at [now]; the Bloc is created inside,
  /// so its handlers see the same clock.
  Future<void> withNow(Future<void> Function() body) => withClock(Clock.fixed(now), body);

  Future<EntryFormBloc> open(EntryFormRequest request) async {
    final bloc = deps.entryForm()..add(EntryFormEvent.started(request));
    await bloc.stream.firstWhere((s) => s.status != EntryFormStatus.loading && s.labels.isNotEmpty);
    return bloc;
  }

  Future<EntryFormState> settle(EntryFormBloc bloc) async {
    await Future<void>.delayed(EntryFormBloc.overlapDebounce + const Duration(milliseconds: 50));
    return bloc.state;
  }

  Future<Entry> seed(String label, String from, String? to, {EntryKind kind = EntryKind.actual}) =>
      deps.entries.create(EntryDraft(kind: kind, labelId: label, start: at(from), end: to == null ? null : at(to)));

  test(
    'J1: defaults from the last entry, pick a label, save → actual entry',
    () => withNow(() async {
      await seed(work.id, '2026-10-25T12:00:00', '2026-10-25T14:05:00');
      final bloc = await open(NewEntryOnDate(today));
      expect(
        (bloc.state.kind, bloc.state.start, bloc.state.end),
        (EntryKind.actual, at('2026-10-25T14:05:00'), at('2026-10-25T14:20:00')),
      );
      expect(bloc.state.canSave, isFalse, reason: 'no label yet');
      expect(bloc.state.quickLabels.map((l) => l.name), ['Work', 'Study'], reason: 'most used first');

      bloc
        ..add(EntryFormEvent.labelSelected(study.id))
        ..add(const EntryFormEvent.savePressed());
      final saved = await bloc.stream.firstWhere((s) => s.status == EntryFormStatus.saved);
      expect(saved.result!.labelId, study.id);
      expect(saved.result!.kind, EntryKind.actual);
      expect((await deps.entries.byId(saved.result!.id))!.end, at('2026-10-25T14:20:00'));
      await bloc.close();
    }),
  );

  test(
    'ENT-02: moving the start into the future switches to planned until the kind is picked',
    () => withNow(() async {
      final bloc = await open(NewEntryOnDate(today));
      bloc.add(const EntryFormEvent.startTimeSet(WallTime.midnight));
      bloc.add(EntryFormEvent.startTimeSet(WallTime(18, 0)));
      expect((await settle(bloc)).kind, EntryKind.planned);
      bloc
        ..add(const EntryFormEvent.kindChanged(EntryKind.actual))
        ..add(EntryFormEvent.startTimeSet(WallTime(19, 0)));
      expect((await settle(bloc)).kind, EntryKind.actual, reason: 'user choice sticks');
      await bloc.close();
    }),
  );

  test(
    'J2: "No end yet" saves an open entry; turning it off restores the end',
    () => withNow(() async {
      await seed(work.id, '2026-10-25T12:00:00', '2026-10-25T14:05:00');
      final bloc = await open(NewEntryOnDate(today));
      bloc.add(const EntryFormEvent.openEndToggled(open: true));
      expect((await settle(bloc)).end, isNull);
      bloc.add(const EntryFormEvent.openEndToggled(open: false));
      expect((await settle(bloc)).end, at('2026-10-25T14:20:00'));
      bloc
        ..add(const EntryFormEvent.openEndToggled(open: true))
        ..add(EntryFormEvent.labelSelected(work.id))
        ..add(const EntryFormEvent.savePressed());
      final saved = await bloc.stream.firstWhere((s) => s.status == EntryFormStatus.saved);
      expect(saved.result!.isOpen, isTrue);
      await bloc.close();
    }),
  );

  test(
    'J5: same-kind overlap shows a note, planned does not, and Save still works',
    () => withNow(() async {
      final workEntry = await seed(work.id, '2026-10-25T14:00:00', '2026-10-25T17:00:00');
      await seed(work.id, '2026-10-25T09:00:00', '2026-10-25T18:00:00', kind: EntryKind.planned);
      final bloc = await open(NewEntryInGap(InstantRange(at('2026-10-25T15:00:00'), at('2026-10-25T16:00:00'))));
      var state = await settle(bloc);
      expect(state.kind, EntryKind.planned, reason: 'gap is in the future');
      bloc.add(const EntryFormEvent.kindChanged(EntryKind.actual));
      state = await settle(bloc);
      expect(state.overlaps.map((e) => e.id), [workEntry.id]);

      bloc
        ..add(EntryFormEvent.labelSelected(study.id))
        ..add(const EntryFormEvent.savePressed());
      expect((await bloc.stream.firstWhere((s) => s.status == EntryFormStatus.saved)).result, isNotNull);
      await bloc.close();
    }),
  );

  test(
    'planned entries default to the label\'s last planned duration (ENT-10)',
    () => withNow(() async {
      await seed(study.id, '2026-10-20T10:00:00', '2026-10-20T10:45:00', kind: EntryKind.planned);
      final bloc = await open(NewEntryOnDate(LocalDate(2026, 10, 27)));
      expect(bloc.state.kind, EntryKind.planned);
      bloc.add(EntryFormEvent.labelSelected(study.id));
      final state = await settle(bloc);
      expect(state.end!.difference(state.start!), const Duration(minutes: 45));
      await bloc.close();
    }),
  );

  test(
    'an end time before the start means the next morning (overnight, ENT-07)',
    () => withNow(() async {
      final bloc = await open(NewEntryOnDate(LocalDate(2026, 10, 24)));
      bloc
        ..add(EntryFormEvent.startTimeSet(WallTime(23, 10)))
        ..add(EntryFormEvent.endTimeSet(WallTime(6, 50)));
      final state = await settle(bloc);
      expect((state.start, state.end), (at('2026-10-24T23:10:00'), at('2026-10-25T06:50:00')));
      await bloc.close();
    }),
  );

  test(
    'chips: −15/+15, 1h, End now',
    () => withNow(() async {
      await seed(work.id, '2026-10-25T12:00:00', '2026-10-25T14:05:00');
      final bloc = await open(NewEntryOnDate(today));
      bloc.add(const EntryFormEvent.startNudged(-15));
      expect((await settle(bloc)).start, at('2026-10-25T13:50:00'));
      bloc.add(const EntryFormEvent.durationPicked(Duration(hours: 1)));
      expect((await settle(bloc)).end, at('2026-10-25T14:50:00'));
      bloc.add(const EntryFormEvent.endNowPressed());
      expect((await settle(bloc)).end, at('2026-10-25T14:22:00'));
      await bloc.close();
    }),
  );

  test(
    'blocked save: over 7 days shows the problem and saves nothing',
    () => withNow(() async {
      final bloc = await open(NewEntryOnDate(LocalDate(2026, 10, 10)));
      bloc
        ..add(EntryFormEvent.labelSelected(work.id))
        ..add(EntryFormEvent.endDateSet(LocalDate(2026, 10, 20)));
      final state = await settle(bloc);
      expect(state.check.problems, {EntryProblem.longerThanSevenDays});
      expect(state.canSave, isFalse);
      await bloc.close();
    }),
  );

  test(
    'edit loads the entry; delete returns it for Undo (ENT-06)',
    () => withNow(() async {
      final entry = await seed(work.id, '2026-10-25T09:00:00', '2026-10-25T10:00:00');
      final bloc = await open(EditEntry(entry.id));
      expect((bloc.state.isEditing, bloc.state.labelId, bloc.state.end), (true, work.id, entry.end));
      bloc.add(const EntryFormEvent.deletePressed());
      final deleted = await bloc.stream.firstWhere((s) => s.status == EntryFormStatus.deleted);
      expect(deleted.result, entry);
      expect(await deps.entries.byId(entry.id), isNull);
      await bloc.close();
    }),
  );

  test(
    'duplicate copies label and times onto another day (ENT-12)',
    () => withNow(() async {
      final entry = await seed(work.id, '2026-10-24T09:00:00', '2026-10-24T10:30:00');
      final bloc = await open(DuplicateEntry(entry.id, onDate: today));
      expect((bloc.state.isEditing, bloc.state.labelId), (false, work.id));
      expect((bloc.state.start, bloc.state.end), (at('2026-10-25T09:00:00'), at('2026-10-25T10:30:00')));
      await bloc.close();
    }),
  );

  test(
    'editing a deleted entry fails cleanly',
    () => withNow(() async {
      final bloc = deps.entryForm()..add(const EntryFormEvent.started(EditEntry('gone')));
      final state = await bloc.stream.firstWhere((s) => s.status == EntryFormStatus.failed);
      expect(state.failure, isA<NotFoundFailure>());
      await bloc.close();
    }),
  );
}
