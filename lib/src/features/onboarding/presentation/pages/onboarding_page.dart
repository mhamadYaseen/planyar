import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/routes/route_names.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/undo_snack_bar.dart';
import '../../../backup/presentation/widgets/backup_texts.dart';
import '../../domain/entities/starter_label.dart';
import '../bloc/onboarding_bloc.dart';

/// First run (S27): welcome → starter labels. Both skippable (SET-04).
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  /// Moving from another phone: the same import preview as in Settings.
  /// A finished import ends onboarding (no starter labels needed).
  static Future<void> _openRestore(BuildContext context, OnboardingState state) async {
    final bloc = context.read<OnboardingBloc>()..add(const OnboardingEvent.restoreOpened());
    final imported = await context.pushNamed<bool>(RouteNames.onboardingRestore, extra: state.pendingRestore);
    if (imported ?? false) bloc.add(const OnboardingEvent.restored());
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<OnboardingBloc>(),
    child: BlocConsumer<OnboardingBloc, OnboardingState>(
      listenWhen: (a, b) =>
          a.done != b.done ||
          (b.failure != null && a.failure != b.failure) ||
          (b.pendingRestore != null && a.pendingRestore != b.pendingRestore),
      listener: (context, state) {
        if (state.done) {
          context.goNamed(RouteNames.today);
        } else if (state.pendingRestore != null) {
          _openRestore(context, state);
        } else if (state.failure case final failure?) {
          final problem = AppLocalizations.of(context).fileProblemOf(failure);
          if (problem == null) {
            showErrorSnackBar(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(problem)));
          }
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
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: context.select((OnboardingBloc b) => b.state.picking)
              ? null
              : () => context.read<OnboardingBloc>().add(const OnboardingEvent.restorePressed()),
          icon: const Icon(Icons.settings_backup_restore),
          label: Text(l10n.onboardingRestore),
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
