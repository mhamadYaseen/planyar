// Phase 1 definition of done (plan §13): journeys J1–J5 and J20 (§4) on the
// real app — real DI, repositories, router and widgets — over an in-memory
// database. "Now" is Sun 25 Oct 2026 14:22:40 in Asia/Baghdad. Times show in
// 12-hour format: the test binding doesn't pass `alwaysUse24HourFormatTestValue`
// on to MediaQuery (Flutter 3.47), and the app follows MediaQuery (D-29).
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:planyar/src/core/di/injection.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/entries/domain/entities/entry.dart';
import 'package:planyar/src/features/entries/domain/entities/entry_draft.dart';
import 'package:planyar/src/features/entries/domain/repositories/entries_repository.dart';
import 'package:planyar/src/features/entries/presentation/widgets/quick_add_sheet.dart';
import 'package:planyar/src/features/labels/domain/entities/label.dart';
import 'package:planyar/src/features/labels/domain/repositories/labels_repository.dart';
import 'package:planyar/src/features/labels/presentation/pages/label_editor_page.dart';
import 'package:planyar/src/features/settings/domain/entities/app_settings.dart';

import '../helpers/app_harness.dart';

final now = DateTime.parse('2026-10-25T14:22:40+03:00');
const listMode = AppSettings(onboardingCompleted: true, dayViewMode: DayViewMode.list);
Instant at(String local) => Instant.parse('$local+03:00');

Future<Label> label(String name) => sl<LabelsRepository>().create(name: name);
Future<Entry> entry(Label label, String from, String? to, {EntryKind kind = EntryKind.actual}) =>
    sl<EntriesRepository>().create(
      EntryDraft(kind: kind, labelId: label.id, start: at(from), end: to == null ? null : at(to)),
    );

Finder inSheet(Finder finder) => find.descendant(of: find.byType(QuickAddSheet), matching: finder);

/// The label editor's own list (not the text fields' inner scrollables).
Finder get editorList => find.descendant(of: find.byType(LabelEditorPage), matching: find.byType(Scrollable)).first;

/// Runs a widget test with the clock fixed at [now].
void journey(String description, Future<void> Function(WidgetTester tester) body) =>
    testWidgets(description, (tester) => withClock(Clock.fixed(now), () => body(tester)));

Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump(); // lay out the scrolled position before tapping
  await tester.tap(finder);
  await settle(tester);
}

void main() {
  journey('J1 — log a past activity in three taps, with Undo', (tester) async {
    await pumpPlanyar(
      tester,
      settings: listMode,
      seed: () async {
        await label('Study');
        await entry(await label('Work'), '2026-10-25T12:00:00', '2026-10-25T14:05:00');
      },
    );

    // AC1: + opens quick add with label chips and no keyboard.
    await tapAndSettle(tester, find.byTooltip('Add entry'));
    expect(find.byType(QuickAddSheet), findsOneWidget);
    expect(inSheet(find.byType(TextField)), findsNothing);
    // AC2: start where the last actual ended; end = now rounded down to 5 min.
    expect(inSheet(find.text('2:05 PM')), findsOneWidget);
    expect(inSheet(find.text('2:20 PM')), findsOneWidget);

    // AC3: label chip + Save.
    await tapAndSettle(tester, inSheet(find.widgetWithText(ChoiceChip, 'Study')));
    await tapAndSettle(tester, inSheet(find.widgetWithText(FilledButton, 'Save')));

    // AC4: shown immediately with "Saved" + Undo.
    expect(find.byType(QuickAddSheet), findsNothing);
    expect(find.text('Saved'), findsOneWidget);
    expect(find.textContaining('2:05 PM–2:20 PM'), findsOneWidget);

    await tapAndSettle(tester, find.text('Undo'));
    expect(find.textContaining('2:05 PM–2:20 PM'), findsNothing);
  });

  journey('J2 — start now, finish later', (tester) async {
    await pumpPlanyar(
      tester,
      settings: listMode,
      seed: () async {
        await label('Study');
        // So quick add starts with an end (14:05 → 14:20) to switch off.
        await entry(await label('Work'), '2026-10-25T12:00:00', '2026-10-25T14:05:00');
      },
    );

    // AC1: "No end yet" saves an open entry.
    await tapAndSettle(tester, find.byTooltip('Add entry'));
    await tapAndSettle(tester, inSheet(find.widgetWithText(ChoiceChip, 'Study')));
    await tapAndSettle(tester, inSheet(find.text('No end yet')));
    await tapAndSettle(tester, inSheet(find.widgetWithText(FilledButton, 'Save')));

    // AC2: "1 to finish" and a Set end button.
    expect(find.text('1 to finish'), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Set end'), findsOneWidget);

    // AC3: To finish → +1h closes it and removes it.
    await tapAndSettle(tester, find.text('1 to finish'));
    expect(find.text('To finish'), findsOneWidget);
    await tapAndSettle(tester, find.text('+1h'));
    expect(find.text('Nothing to finish. Entries without an end show up here.'), findsOneWidget);
    expect(find.text('Entry ended'), findsOneWidget);
  });

  journey('J3 — create a label while adding an entry', (tester) async {
    await pumpPlanyar(tester, settings: listMode, seed: () => label('Study'));
    await tapAndSettle(tester, find.byTooltip('Add entry'));
    await tapAndSettle(tester, inSheet(find.text('Search labels')));

    // AC3: "  study " finds the existing label; no create row.
    await tester.enterText(find.byType(TextField).last, '  study ');
    await settle(tester);
    expect(find.textContaining('Create'), findsNothing);
    expect(find.widgetWithText(ListTile, 'Study'), findsOneWidget);

    // AC1: a new name offers Create as the first row.
    await tester.enterText(find.byType(TextField).last, 'Reading');
    await settle(tester);
    expect(find.text('Create "Reading"'), findsOneWidget);

    // AC2: creating selects it and returns to the entry.
    await tapAndSettle(tester, find.text('Create "Reading"'));
    final chip = tester.widget<ChoiceChip>(inSheet(find.widgetWithText(ChoiceChip, 'Reading')));
    expect(chip.selected, isTrue);
  });

  journey('J4 — an overnight sleep shows on both days, clipped', (tester) async {
    await pumpPlanyar(
      tester,
      settings: listMode,
      seed: () async {
        final sleep = await label('Sleep');
        await entry(sleep, '2026-10-23T23:10:00', '2026-10-24T06:50:00');
        // AC4: ends exactly at Sunday 00:00 → not on Sunday.
        await entry(await label('Reading'), '2026-10-24T22:00:00', '2026-10-25T00:00:00');
      },
    );
    expect(find.textContaining('Reading'), findsNothing);
    expect(find.text('Nothing logged yet. Tap + or tap the timeline to add what you did.'), findsOneWidget);

    // Saturday: the morning part; "tracked" counts only Saturday's part (AC3).
    await tapAndSettle(tester, find.byTooltip('Previous day'));
    expect(find.text('Sat 24 Oct'), findsOneWidget);
    expect(find.textContaining('Fri 11:10 PM → Sat 6:50 AM · 7 h 40 m'), findsOneWidget);
    // 6 h 50 m of sleep + Reading 22:00–24:00 (AC3: only Saturday's parts).
    expect(find.textContaining('8 h 50 m tracked'), findsOneWidget);
    expect(find.byIcon(Icons.nightlight_outlined), findsOneWidget);

    // Friday: the evening part.
    await tapAndSettle(tester, find.byTooltip('Previous day'));
    expect(find.text('Fri 23 Oct'), findsOneWidget);
    expect(find.textContaining('50 m tracked'), findsOneWidget);

    // AC2: both segments open the same entry.
    await tapAndSettle(tester, find.textContaining('Fri 11:10 PM → Sat 6:50 AM'));
    expect(find.text('Edit entry'), findsOneWidget);
  });

  journey('J5 — overlapping entries warn but save', (tester) async {
    await pumpPlanyar(
      tester,
      settings: listMode,
      seed: () async {
        final work = await label('Work');
        await entry(work, '2026-10-25T14:00:00', '2026-10-25T17:00:00');
        await entry(await label('Call'), '2026-10-25T15:00:00', '2026-10-25T16:00:00');
        // AC3: a planned entry over the same time adds no warning.
        await entry(work, '2026-10-25T15:00:00', '2026-10-25T16:00:00', kind: EntryKind.planned);
      },
    );

    // AC2: header chip and a ⚠ on both actual entries.
    expect(find.text('1 overlap'), findsOneWidget);
    expect(find.byIcon(Icons.warning_amber_rounded), findsNWidgets(3)); // 2 rows + chip

    // AC1: the editor names the overlapping entry.
    await tapAndSettle(tester, find.textContaining('Actual · 3:00 PM–4:00 PM'));
    expect(find.textContaining('Overlaps with Work 2:00 PM–5:00 PM'), findsOneWidget);
    await tapAndSettle(tester, find.widgetWithText(FilledButton, 'Save'));
    expect(find.text('Saved'), findsOneWidget);
  });

  journey('J20 — rename, can\'t delete in use, archive', (tester) async {
    await pumpPlanyar(
      tester,
      settings: listMode,
      seed: () async => entry(await label('Study'), '2026-10-25T09:00:00', '2026-10-25T10:00:00'),
    );
    await tapAndSettle(tester, find.byTooltip('Open settings'));
    await tapAndSettle(tester, find.text('Labels & categories'));
    await tapAndSettle(tester, find.text('Study'));

    // AC2: Delete is disabled with the reason; Archive is offered.
    await tester.scrollUntilVisible(find.textContaining("Can't delete"), 300, scrollable: editorList);
    final delete = tester.widget<TextButton>(find.widgetWithText(TextButton, 'Delete'));
    expect(delete.onPressed, isNull);
    expect(find.textContaining("Can't delete: used by 1 entry."), findsOneWidget);

    // AC1: rename shows everywhere.
    await tester.scrollUntilVisible(find.widgetWithText(TextFormField, 'Name'), -300, scrollable: editorList);
    await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'Deep work');
    await tapAndSettle(tester, find.widgetWithText(TextButton, 'Save'));
    expect(find.text('Deep work'), findsOneWidget);

    // AC3: archived → gone from pickers, still on its entries.
    await tapAndSettle(tester, find.text('Deep work'));
    await tester.scrollUntilVisible(find.text('Archive'), 300, scrollable: editorList);
    await tapAndSettle(tester, find.text('Archive'));
    expect(find.text('Archived (1)'), findsOneWidget);
    await tester.pageBack();
    await settle(tester);
    await tester.pageBack();
    await settle(tester);
    expect(find.textContaining('Deep work'), findsOneWidget);
    await tapAndSettle(tester, find.byTooltip('Add entry'));
    expect(inSheet(find.widgetWithText(ChoiceChip, 'Deep work')), findsNothing);
  });
}
