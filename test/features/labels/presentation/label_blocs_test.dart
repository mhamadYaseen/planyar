// Label picker (J3) and label editor (J20) with real repositories.
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/labels/domain/entities/label.dart';
import 'package:planyar/src/features/labels/domain/services/label_rules.dart';
import 'package:planyar/src/features/labels/presentation/bloc/label_editor_bloc.dart';
import 'package:planyar/src/features/labels/presentation/bloc/label_picker_bloc.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../../helpers/test_deps.dart';

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late TestDeps deps;
  setUp(() async => deps = await TestDeps.create());
  tearDown(() => deps.close());

  group('label picker (J3)', () {
    Future<LabelPickerBloc> openPicker() async {
      final bloc = deps.labelPicker()..add(const LabelPickerEvent.started());
      await bloc.stream.firstWhere((s) => !s.loading);
      return bloc;
    }

    test('AC1/AC2: typing a new name offers Create; creating returns it with an unused color', () async {
      await deps.labels.create(name: 'Study');
      final bloc = await openPicker();
      bloc.add(const LabelPickerEvent.queryChanged('Reading'));
      await pumpEventQueue();
      expect(bloc.state.createOption, const CreateOption.create('Reading'));
      bloc.add(const LabelPickerEvent.createPressed());
      final picked = (await bloc.stream.firstWhere((s) => s.picked != null)).picked!;
      expect((picked.name, picked.colorKey), ('Reading', 'indigo'));
      await bloc.close();
    });

    test('AC3: "  study " shows the existing label, no create option', () async {
      await deps.labels.create(name: 'Study');
      final bloc = await openPicker();
      bloc.add(const LabelPickerEvent.queryChanged('  study '));
      await pumpEventQueue();
      expect(bloc.state.results.single.name, 'Study');
      expect(bloc.state.createOption, const CreateOption.none());
      await bloc.close();
    });

    test('an archived name offers Restore, which brings it back (LBL-05)', () async {
      final old = await deps.labels.create(name: 'Chess');
      await deps.labels.setArchived(old.id, archived: true);
      final bloc = await openPicker();
      expect(bloc.state.quickChips, isEmpty, reason: 'archived labels are hidden');
      bloc.add(const LabelPickerEvent.queryChanged('chess'));
      await pumpEventQueue();
      expect(bloc.state.createOption, isA<RestoreArchivedLabel>());
      bloc.add(LabelPickerEvent.restorePressed(old));
      final picked = (await bloc.stream.firstWhere((s) => s.picked != null)).picked!;
      expect(picked.isArchived, isFalse);
      await bloc.close();
    });
  });

  group('label editor (J20)', () {
    Future<LabelEditorBloc> openEditor(String? id) async {
      final bloc = deps.labelEditor()..add(LabelEditorEvent.started(labelId: id));
      await bloc.stream.firstWhere((s) => s.status == EditorStatus.ready);
      return bloc;
    }

    test('AC1: rename saves; AC2: delete is not allowed while in use, archive is', () async {
      final study = await deps.labels.create(name: 'Study');
      await deps.entries.create(
        EntryDraft(kind: EntryKind.actual, labelId: study.id, start: Instant.parse('2026-10-25T10:00:00Z')),
      );
      final bloc = await openEditor(study.id);
      expect(bloc.state.usage, const LabelUsage(entries: 1));
      expect(bloc.state.canDelete, isFalse);

      bloc
        ..add(const LabelEditorEvent.nameChanged('Deep work'))
        ..add(const LabelEditorEvent.savePressed());
      await bloc.stream.firstWhere((s) => s.status == EditorStatus.saved);
      expect((await deps.labels.byId(study.id))!.name, 'Deep work');
      await bloc.close();

      final again = await openEditor(study.id);
      again.add(const LabelEditorEvent.archiveToggled());
      await again.stream.firstWhere((s) => s.status == EditorStatus.saved);
      expect((await deps.labels.byId(study.id))!.isArchived, isTrue);
      await again.close();
    });

    test('a duplicate name is reported, not saved', () async {
      await deps.labels.create(name: 'Work');
      final bloc = await openEditor(null);
      bloc
        ..add(const LabelEditorEvent.nameChanged(' work '))
        ..add(const LabelEditorEvent.savePressed());
      final state = await bloc.stream.firstWhere((s) => s.nameProblem != null);
      expect(state.nameProblem, NameProblem.duplicate);
      await bloc.close();
    });

    test('an unused label can be deleted', () async {
      final chess = await deps.labels.create(name: 'Chess');
      final bloc = await openEditor(chess.id);
      expect(bloc.state.canDelete, isTrue);
      bloc.add(const LabelEditorEvent.deletePressed());
      await bloc.stream.firstWhere((s) => s.status == EditorStatus.deleted);
      expect(await deps.labels.byId(chess.id), isNull);
      await bloc.close();
    });
  });
}
