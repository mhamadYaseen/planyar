import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/streams.dart';
import '../../domain/entities/label.dart';
import '../../domain/usecases/label_usecases.dart';

part 'labels_bloc.freezed.dart';

/// One section of the Labels & categories list (S5).
final class LabelGroup {
  const LabelGroup({required this.category, required this.labels});

  /// Null = Uncategorized.
  final Category? category;
  final List<Label> labels;
}

final class LabelsOverview {
  const LabelsOverview({
    required this.groups,
    required this.archived,
    required this.categories,
    required this.entryCounts,
  });

  final List<LabelGroup> groups;
  final List<Label> archived;
  final List<Category> categories;
  final Map<String, int> entryCounts;
}

@freezed
sealed class LabelsEvent with _$LabelsEvent {
  const factory LabelsEvent.started() = _Started;
}

/// Labels grouped by category with usage counts (S5).
class LabelsBloc extends Bloc<LabelsEvent, DataState<LabelsOverview>> {
  LabelsBloc({required this._labels, required this._categories, required this._counts})
    : super(const DataState.loading()) {
    on<_Started>(
      (event, emit) => emit.forEach<LabelsOverview>(
        combineLatest2(
          combineLatest2(_labels(const NoParams()), _categories(const NoParams()), (l, c) => (l, c)),
          _counts(const NoParams()),
          (lc, counts) => _overview(lc.$1, lc.$2, counts),
        ),
        onData: DataState.success,
        onError: (error, _) => DataState.error(Failure.database(error.toString())),
      ),
    );
  }

  final WatchLabels _labels;
  final WatchCategories _categories;
  final WatchLabelEntryCounts _counts;

  static LabelsOverview _overview(List<Label> labels, List<Category> categories, Map<String, int> counts) {
    final active = labels.where((l) => !l.isArchived);
    final groups = [
      for (final category in categories)
        LabelGroup(category: category, labels: active.where((l) => l.categoryId == category.id).toList()),
      LabelGroup(
        category: null,
        labels: active.where((l) => l.categoryId == null || !categories.any((c) => c.id == l.categoryId)).toList(),
      ),
    ];
    return LabelsOverview(
      groups: groups,
      archived: labels.where((l) => l.isArchived).toList(),
      categories: categories,
      entryCounts: counts,
    );
  }
}
