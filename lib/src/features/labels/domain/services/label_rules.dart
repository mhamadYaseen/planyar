import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/label.dart';
import '../entities/label_color_keys.dart';

part 'label_rules.freezed.dart';

enum NameProblem { empty, tooLong, duplicate }

/// What the label picker offers for the typed text (J3, LBL-05).
@freezed
sealed class CreateOption with _$CreateOption {
  const factory CreateOption.none() = NoCreateOption;

  /// "Create '…'" — [name] is cleaned (trimmed, spaces collapsed).
  const factory CreateOption.create(String name) = CreateNewLabel;

  /// "Restore archived '…'?"
  const factory CreateOption.restore(Label label) = RestoreArchivedLabel;
}

/// Picker contents (LBL-06).
final class LabelPickerContents {
  const LabelPickerContents({required this.quickChips, required this.all});

  /// Up to 8 most used in the last 14 days, then alphabetical.
  final List<Label> quickChips;

  /// Every active label, alphabetical.
  final List<Label> all;
}

/// Naming, color and picker rules for labels (and category names).
abstract final class LabelRules {
  static const maxNameLength = 40;
  static const maxQuickChips = 8;
  static final _spaces = RegExp(r'\s+');

  /// Trimmed with inner whitespace collapsed — the stored display name.
  static String cleanName(String name) => name.trim().replaceAll(_spaces, ' ');

  /// Lower-cased [cleanName] — enforces "unique ignoring case and spaces".
  static String nameKeyOf(String name) => cleanName(name).toLowerCase();

  /// Null when [name] is valid. [existingKeys] excludes the record being edited.
  static NameProblem? checkName(String name, {required Iterable<String> existingKeys}) {
    final clean = cleanName(name);
    if (clean.isEmpty) return NameProblem.empty;
    if (clean.length > maxNameLength) return NameProblem.tooLong;
    if (existingKeys.contains(nameKeyOf(clean))) return NameProblem.duplicate;
    return null;
  }

  /// The first palette color no active label uses (auto order); when all are
  /// used, the least used one.
  static String nextColorKey(Iterable<String> colorKeysInUse) {
    final counts = {for (final key in labelColorAutoOrder) key: 0};
    for (final key in colorKeysInUse) {
      if (counts.containsKey(key)) counts[key] = counts[key]! + 1;
    }
    var best = labelColorAutoOrder.first;
    for (final key in labelColorAutoOrder) {
      if (counts[key]! < counts[best]!) best = key;
    }
    return best;
  }

  /// Active labels split into quick chips and the full alphabetical list.
  /// [recentUse] maps label ID → entries in the last 14 days.
  static LabelPickerContents picker(Iterable<Label> labels, {required Map<String, int> recentUse}) {
    final active = labels.where((l) => !l.isArchived).toList()..sort(_alphabetical);
    final chips = [...active]
      ..sort((a, b) {
        final byUse = (recentUse[b.id] ?? 0).compareTo(recentUse[a.id] ?? 0);
        return byUse != 0 ? byUse : _alphabetical(a, b);
      });
    return LabelPickerContents(quickChips: chips.take(maxQuickChips).toList(), all: active);
  }

  /// Active labels whose name contains the typed text (ignoring case and
  /// spaces); names starting with it come first.
  static List<Label> search(Iterable<Label> labels, String query) {
    final key = nameKeyOf(query);
    final found = labels.where((l) => !l.isArchived && l.nameKey.contains(key)).toList();
    return found..sort((a, b) {
      final aPrefix = a.nameKey.startsWith(key) ? 0 : 1;
      final bPrefix = b.nameKey.startsWith(key) ? 0 : 1;
      return aPrefix != bPrefix ? aPrefix - bPrefix : _alphabetical(a, b);
    });
  }

  /// Whether the picker should offer to create or restore a label for [query].
  static CreateOption createOption(String query, Iterable<Label> labels) {
    final name = cleanName(query);
    if (name.isEmpty || name.length > maxNameLength) return const CreateOption.none();
    final key = nameKeyOf(name);
    for (final label in labels) {
      if (label.nameKey == key) {
        return label.isArchived ? CreateOption.restore(label) : const CreateOption.none();
      }
    }
    return CreateOption.create(name);
  }

  static int _alphabetical(Label a, Label b) {
    final byKey = a.nameKey.compareTo(b.nameKey);
    return byKey != 0 ? byKey : a.id.compareTo(b.id);
  }
}
