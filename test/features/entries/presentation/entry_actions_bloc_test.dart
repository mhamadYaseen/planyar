// Quick actions and Undo (ENT-05, ENT-06, S11, §6.11).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/entries/presentation/bloc/entry_actions_bloc.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/test_deps.dart';

Instant at(String local) => Instant.parse('$local+03:00');

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late TestDeps deps;
  late Entry open;

  setUp(() async {
    deps = await TestDeps.create();
    final label = await deps.labels.create(name: 'Study');
    open = await deps.entries.create(
      EntryDraft(kind: EntryKind.actual, labelId: label.id, start: at('2026-10-25T14:05:00')),
    );
  });
  tearDown(() => deps.close());

  test('J2 AC3: +1h closes an open entry; Undo reopens it', () async {
    final bloc = deps.entryActions()..add(EntryActionsEvent.endSet(open, at('2026-10-25T15:05:00')));
    final action = (await bloc.stream.firstWhere((s) => s.lastAction != null)).lastAction!;
    expect((await deps.entries.byId(open.id))!.end, at('2026-10-25T15:05:00'));
    bloc.add(EntryActionsEvent.undoRequested(action));
    await pumpEventQueue();
    expect((await deps.entries.byId(open.id))!.isOpen, isTrue);
    await bloc.close();
  });

  test('delete with Undo restores the exact entry', () async {
    final bloc = deps.entryActions()..add(EntryActionsEvent.deleteRequested(open));
    final action = (await bloc.stream.firstWhere((s) => s.lastAction != null)).lastAction!;
    expect(await deps.entries.byId(open.id), isNull);
    bloc.add(EntryActionsEvent.undoRequested(action));
    await pumpEventQueue();
    expect(await deps.entries.byId(open.id), open);
    await bloc.close();
  });

  test('undo of a create deletes it (J1 AC4)', () async {
    final bloc = deps.entryActions()..add(EntryActionsEvent.undoRequested(UndoableAction.created(open)));
    await pumpEventQueue();
    expect(await deps.entries.byId(open.id), isNull);
    await bloc.close();
  });

  test('an end before the start is refused and reported', () async {
    final bloc = deps.entryActions()..add(EntryActionsEvent.endSet(open, at('2026-10-25T14:00:00')));
    final state = await bloc.stream.firstWhere((s) => s.failure != null);
    expect(state.lastAction, isNull);
    expect((await deps.entries.byId(open.id))!.isOpen, isTrue);
    await bloc.close();
  });
}
