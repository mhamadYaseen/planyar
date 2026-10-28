// Label rules (LBL-01, LBL-02, LBL-05, LBL-06, J3).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/app/theme/label_icons.dart';
import 'package:planyar/src/app/theme/label_palette.dart';
import 'package:planyar/src/core/time/instant.dart';
import 'package:planyar/src/features/labels/domain/entities/label.dart';
import 'package:planyar/src/features/labels/domain/entities/label_color_keys.dart';
import 'package:planyar/src/features/labels/domain/entities/label_icon_keys.dart';
import 'package:planyar/src/features/labels/domain/services/label_rules.dart';

final t0 = Instant.parse('2026-10-01T00:00:00Z');
Label label(String id, String name, {String color = 'teal', bool archived = false}) => Label(
  id: id,
  name: name,
  nameKey: LabelRules.nameKeyOf(name),
  colorKey: color,
  isArchived: archived,
  createdAt: t0,
  updatedAt: t0,
);

void main() {
  group('names', () {
    test('name key ignores case and surrounding / repeated spaces', () {
      expect(LabelRules.nameKeyOf('  Deep   Work '), 'deep work');
      expect(LabelRules.nameKeyOf('ÇAY'), 'çay');
      expect(LabelRules.cleanName('  Deep   Work '), 'Deep Work');
    });

    test('1–40 characters, unique by key', () {
      expect(LabelRules.checkName('Study', existingKeys: const []), isNull);
      expect(LabelRules.checkName('   ', existingKeys: const []), NameProblem.empty);
      expect(LabelRules.checkName('x' * 41, existingKeys: const []), NameProblem.tooLong);
      expect(LabelRules.checkName('  x${' ' * 50}', existingKeys: const []), isNull);
      expect(LabelRules.checkName(' study ', existingKeys: const ['study']), NameProblem.duplicate);
    });
  });

  group('colors (LBL-01)', () {
    test('the domain keys match the theme palette', () {
      expect(labelColorKeys, LabelColor.values.map((c) => c.key).toList());
      expect(labelColorAutoOrder.toSet(), labelColorKeys.toSet());
    });

    test('the domain icon keys match the theme icons (backups validate against them)', () {
      expect(labelIconKeys, LabelIcons.all.keys.toList());
    });

    test('next color is the first unused in auto order', () {
      expect(LabelRules.nextColorKey(const []), 'teal');
      expect(LabelRules.nextColorKey(const ['teal', 'indigo']), 'amber');
    });

    test('when all are used, the least used wins', () {
      final used = [...labelColorKeys, ...labelColorKeys.where((k) => k != 'rose')];
      expect(LabelRules.nextColorKey(used), 'rose');
    });
  });

  group('picker (LBL-06)', () {
    final labels = [
      label('1', 'Work'),
      label('2', 'Study'),
      label('3', 'Sleep'),
      label('4', 'Exercise'),
      label('5', 'Old hobby', archived: true),
      label('6', 'Meals'),
    ];

    test('quick chips: most used in the last 14 days, then alphabetical; archived hidden', () {
      final picker = LabelRules.picker(labels, recentUse: const {'2': 9, '1': 9, '3': 2, '5': 30});
      expect(picker.quickChips.map((l) => l.name), ['Study', 'Work', 'Sleep', 'Exercise', 'Meals']);
      expect(picker.all.map((l) => l.name), ['Exercise', 'Meals', 'Sleep', 'Study', 'Work']);
    });

    test('at most 8 chips', () {
      final many = [for (var i = 0; i < 12; i++) label('$i', 'Label $i')];
      expect(LabelRules.picker(many, recentUse: const {}).quickChips, hasLength(8));
    });

    test('search matches name key; prefix matches first', () {
      final found = LabelRules.search(labels, '  E ');
      expect(found.map((l) => l.name), ['Exercise', 'Meals', 'Sleep']);
    });
  });

  group('create / restore option (J3, LBL-05)', () {
    final labels = [label('1', 'Study'), label('2', 'Old hobby', archived: true)];

    test('J3 AC1: a new name offers Create', () {
      expect(LabelRules.createOption('Reading', labels), const CreateOption.create('Reading'));
      expect(LabelRules.createOption('  Deep   reading ', labels), const CreateOption.create('Deep reading'));
    });

    test('J3 AC3: "  study " finds the existing label instead', () {
      expect(LabelRules.createOption('  study ', labels), const CreateOption.none());
      expect(LabelRules.search(labels, '  study ').single.name, 'Study');
    });

    test('an archived name offers Restore', () {
      expect(LabelRules.createOption('old HOBBY', labels), CreateOption.restore(labels[1]));
    });

    test('empty or too long input offers nothing', () {
      expect(LabelRules.createOption('  ', labels), const CreateOption.none());
      expect(LabelRules.createOption('x' * 41, labels), const CreateOption.none());
    });
  });
}
