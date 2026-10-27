import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/instant.dart';

part 'label.freezed.dart';

/// A reusable activity name with a palette color (plan §3.2, LBL-02).
@freezed
abstract class Label with _$Label {
  const factory Label({
    required String id,
    required String name,

    /// Lower-cased, trimmed, whitespace collapsed — see `nameKeyOf`.
    required String nameKey,

    /// A key from `labelColorKeys`, e.g. `teal`.
    required String colorKey,
    String? iconKey,
    String? categoryId,
    @Default(false) bool isArchived,
    @Default(0) int sortOrder,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _Label;
}

/// An optional group above labels (and tasks) (plan §3.2, CAT-01).
@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String nameKey,
    String? colorKey,
    @Default(0) int sortOrder,
    required Instant createdAt,
    required Instant updatedAt,
  }) = _Category;
}

/// How often a label is referenced — decides whether it can be deleted (LBL-04).
@freezed
abstract class LabelUsage with _$LabelUsage {
  const factory LabelUsage({@Default(0) int entries, @Default(0) int routines, @Default(0) int routineExceptions}) =
      _LabelUsage;

  const LabelUsage._();

  bool get isInUse => entries + routines + routineExceptions > 0;
}
