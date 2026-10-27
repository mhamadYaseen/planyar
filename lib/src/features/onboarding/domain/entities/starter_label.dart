/// A suggested label offered in onboarding step 2 (plan §5.4, CAT-05).
final class StarterLabel {
  const StarterLabel({required this.name, required this.colorKey, required this.category});

  final String name;
  final String colorKey;
  final StarterCategory category;
}

final class StarterCategory {
  const StarterCategory(this.name, this.colorKey);

  final String name;
  final String colorKey;
}

abstract final class Starters {
  static const rest = StarterCategory('Rest', 'indigo');
  static const work = StarterCategory('Work', 'blue');
  static const learning = StarterCategory('Learning', 'teal');
  static const health = StarterCategory('Health', 'green');
  static const personal = StarterCategory('Personal', 'rose');

  /// All preselected; "Skip" creates none (plan §5.4).
  static const labels = <StarterLabel>[
    StarterLabel(name: 'Sleep', colorKey: 'indigo', category: rest),
    StarterLabel(name: 'Work', colorKey: 'blue', category: work),
    StarterLabel(name: 'Study', colorKey: 'teal', category: learning),
    StarterLabel(name: 'Exercise', colorKey: 'green', category: health),
    StarterLabel(name: 'Meals', colorKey: 'amber', category: health),
    StarterLabel(name: 'Commute', colorKey: 'gray', category: work),
    StarterLabel(name: 'Leisure', colorKey: 'violet', category: personal),
    StarterLabel(name: 'Chores', colorKey: 'brown', category: personal),
  ];
}
