// Onboarding steps 1–2 (SET-04, CAT-05).
import 'package:flutter_test/flutter_test.dart';
import 'package:planyar/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;

import '../../helpers/test_deps.dart';

void main() {
  setUpAll(tzdata.initializeTimeZones);
  late TestDeps deps;
  setUp(() async => deps = await TestDeps.create());
  tearDown(() => deps.close());

  test('chosen starters become labels in their categories; onboarding is marked done', () async {
    final bloc = deps.onboarding()
      ..add(const OnboardingEvent.nextPressed())
      ..add(const OnboardingEvent.starterToggled('Commute'))
      ..add(const OnboardingEvent.starterToggled('Chores'))
      ..add(const OnboardingEvent.nextPressed());
    await bloc.stream.firstWhere((s) => s.done);
    final labels = await deps.labels.all();
    expect(labels.map((l) => l.name), ['Exercise', 'Leisure', 'Meals', 'Sleep', 'Study', 'Work']);
    final categories = {for (final c in await deps.categories.all()) c.id: c.name};
    expect(categories.values.toSet(), {'Rest', 'Work', 'Learning', 'Health', 'Personal'});
    final sleep = labels.firstWhere((l) => l.name == 'Sleep');
    expect(categories[sleep.categoryId], 'Rest');
    expect((await deps.settings.load()).onboardingCompleted, isTrue);
    await bloc.close();
  });

  test('Skip creates nothing but finishes onboarding', () async {
    final bloc = deps.onboarding()
      ..add(const OnboardingEvent.nextPressed())
      ..add(const OnboardingEvent.skipPressed());
    await bloc.stream.firstWhere((s) => s.done);
    expect(await deps.labels.all(), isEmpty);
    expect((await deps.settings.load()).onboardingCompleted, isTrue);
    await bloc.close();
  });

  test('running it again never duplicates labels', () async {
    await deps.labels.create(name: 'sleep');
    final bloc = deps.onboarding()
      ..add(const OnboardingEvent.nextPressed())
      ..add(const OnboardingEvent.nextPressed());
    await bloc.stream.firstWhere((s) => s.done);
    expect((await deps.labels.all()).where((l) => l.nameKey == 'sleep'), hasLength(1));
    await bloc.close();
  });
}
