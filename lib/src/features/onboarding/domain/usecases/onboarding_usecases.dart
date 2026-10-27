import '../../../../core/usecases/guard.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../labels/domain/entities/label.dart';
import '../../../labels/domain/repositories/labels_repository.dart';
import '../../../labels/domain/services/label_rules.dart';
import '../../../settings/domain/repositories/settings_repository.dart';
import '../entities/starter_label.dart';

/// Creates the chosen starter labels and their categories, skipping names
/// that already exist, then marks onboarding done (SET-04, CAT-05).
final class FinishOnboarding implements UseCase<DataState<void>, List<StarterLabel>> {
  const FinishOnboarding(this._labels, this._categories, this._settings);

  final LabelsRepository _labels;
  final CategoriesRepository _categories;
  final SettingsRepository _settings;

  @override
  Future<DataState<void>> call(List<StarterLabel> chosen) => guard(() async {
    final existingLabels = {for (final l in await _labels.all()) l.nameKey};
    final categoryIds = {for (final c in await _categories.all()) c.nameKey: c.id};
    for (final starter in chosen) {
      if (existingLabels.contains(LabelRules.nameKeyOf(starter.name))) continue;
      final categoryKey = LabelRules.nameKeyOf(starter.category.name);
      final categoryId =
          categoryIds[categoryKey] ??
          (categoryIds[categoryKey] = (await _categories.create(
            name: starter.category.name,
            colorKey: starter.category.colorKey,
          )).id);
      final Label created = await _labels.create(
        name: starter.name,
        colorKey: starter.colorKey,
        categoryId: categoryId,
      );
      existingLabels.add(created.nameKey);
    }
    final settings = await _settings.load();
    await _settings.save(settings.copyWith(onboardingCompleted: true));
  });
}
