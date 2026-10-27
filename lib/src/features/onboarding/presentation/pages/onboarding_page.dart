import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/undo_snack_bar.dart';
import '../../domain/entities/starter_label.dart';
import '../bloc/onboarding_bloc.dart';

/// First run (S27): welcome → starter labels. Both skippable (SET-04).
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<OnboardingBloc>(),
    child: BlocConsumer<OnboardingBloc, OnboardingState>(
      listenWhen: (a, b) => a.done != b.done || (b.failure != null && a.failure != b.failure),
      listener: (context, state) {
        if (state.done) {
          context.goNamed(RouteNames.today);
        } else if (state.failure != null) {
          showErrorSnackBar(context);
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: switch (state.step) {
              OnboardingStep.welcome => const _Welcome(),
              OnboardingStep.starterLabels => _Starters(state: state),
            },
          ),
        ),
      ),
    ),
  );
}

class _Welcome extends StatelessWidget {
  const _Welcome();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Icon(Icons.wb_sunny_outlined, size: 64, color: theme.colorScheme.primary),
        const SizedBox(height: 24),
        Text(l10n.onboardingWelcomeTitle, style: theme.textTheme.headlineMedium, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Text(l10n.onboardingWelcomeBody, style: theme.textTheme.bodyLarge, textAlign: TextAlign.center),
        const Spacer(),
        FilledButton(
          style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
          onPressed: () => context.read<OnboardingBloc>().add(const OnboardingEvent.nextPressed()),
          child: Text(l10n.getStarted),
        ),
      ],
    );
  }
}

class _Starters extends StatelessWidget {
  const _Starters({required this.state});

  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final bloc = context.read<OnboardingBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.starterTitle, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(l10n.starterBody, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final starter in Starters.labels)
                  FilterChip(
                    label: Text(starter.name),
                    selected: state.selected.contains(starter.name),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onSelected: (_) => bloc.add(OnboardingEvent.starterToggled(starter.name)),
                  ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            TextButton(onPressed: () => bloc.add(const OnboardingEvent.backPressed()), child: Text(l10n.back)),
            const Spacer(),
            TextButton(
              onPressed: state.finishing ? null : () => bloc.add(const OnboardingEvent.skipPressed()),
              child: Text(l10n.skip),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: state.finishing ? null : () => bloc.add(const OnboardingEvent.nextPressed()),
              child: Text(l10n.continueButton),
            ),
          ],
        ),
      ],
    );
  }
}
