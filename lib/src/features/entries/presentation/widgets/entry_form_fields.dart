import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/widgets/pickers.dart';
import '../../../../core/widgets/time_scope.dart';
import '../../../labels/presentation/widgets/label_picker_sheet.dart';
import '../../../labels/presentation/widgets/label_visuals.dart';
import '../../domain/entities/entry.dart';
import '../../domain/services/entry_validator.dart';
import '../bloc/entry_form_bloc.dart';

/// Actual | Planned (ENT-01, ENT-02).
class KindToggle extends StatelessWidget {
  const KindToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final kind = context.select((EntryFormBloc b) => b.state.kind);
    return SegmentedButton<EntryKind>(
      segments: [
        ButtonSegment(
          value: EntryKind.actual,
          label: Text(l10n.kindActual),
          icon: const Icon(Icons.check_circle_outline),
        ),
        ButtonSegment(value: EntryKind.planned, label: Text(l10n.kindPlanned), icon: const Icon(Icons.event_outlined)),
      ],
      selected: {kind},
      onSelectionChanged: (selection) => context.read<EntryFormBloc>().add(EntryFormEvent.kindChanged(selection.first)),
    );
  }
}

/// Quick label chips plus search / create (LBL-01, LBL-06).
class LabelSection extends StatelessWidget {
  const LabelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final bloc = context.read<EntryFormBloc>();
    return BlocBuilder<EntryFormBloc, EntryFormState>(
      buildWhen: (a, b) => a.labelId != b.labelId || a.quickLabels != b.quickLabels || a.labels != b.labels,
      builder: (context, state) {
        final selected = state.labels[state.labelId];
        final chips = [
          if (selected != null && !state.quickLabels.any((l) => l.id == selected.id)) selected,
          ...state.quickLabels,
        ];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(l10n.labelHeading, style: Theme.of(context).textTheme.labelLarge),
            if (chips.isEmpty) Text(l10n.noLabelsYet),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final label in chips)
                  LabelChip(
                    label: label,
                    selected: label.id == state.labelId,
                    onSelected: () => bloc.add(EntryFormEvent.labelSelected(label.id)),
                  ),
                ActionChip(
                  avatar: const Icon(Icons.search),
                  label: Text(l10n.searchLabels),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  onPressed: () async {
                    final picked = await showLabelPicker(context);
                    if (picked != null) bloc.add(EntryFormEvent.labelSelected(picked.id));
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

/// "Start  Sun 25 Oct  14:05  [−15][+15]".
class StartRow extends StatelessWidget {
  const StartRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final bloc = context.read<EntryFormBloc>();
    final start = context.select((EntryFormBloc b) => b.state.start);
    if (start == null) return const SizedBox.shrink();
    return _TimeRow(
      title: l10n.startLabel,
      date: time.day(time.dateOf(start)),
      clock: time.timeMarked(start),
      onDate: () async {
        final date = await pickLocalDate(context, initial: time.dateOf(start), today: time.today());
        if (date != null) bloc.add(EntryFormEvent.startDateSet(date));
      },
      onClock: () async {
        final picked = await pickWallTime(context, initial: time.math.wallTimeOf(start));
        if (picked != null) bloc.add(EntryFormEvent.startTimeSet(picked));
      },
      trailing: [
        _SmallChip(
          text: l10n.minus15,
          tooltip: l10n.earlierBy15,
          onTap: () => bloc.add(const EntryFormEvent.startNudged(-15)),
        ),
        _SmallChip(
          text: l10n.plus15,
          tooltip: l10n.laterBy15,
          onTap: () => bloc.add(const EntryFormEvent.startNudged(15)),
        ),
      ],
    );
  }
}

/// End time, "Now", duration chips and "No end yet" (ENT-05).
class EndSection extends StatelessWidget {
  const EndSection({super.key});

  static const _durations = [Duration(minutes: 30), Duration(hours: 1), Duration(hours: 2)];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final time = TimeScope.of(context);
    final bloc = context.read<EntryFormBloc>();
    return BlocBuilder<EntryFormBloc, EntryFormState>(
      buildWhen: (a, b) => a.end != b.end || a.start != b.start,
      builder: (context, state) {
        final start = state.start;
        if (start == null) return const SizedBox.shrink();
        final end = state.end;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (end == null)
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
                child: Row(
                  children: [
                    SizedBox(width: 56, child: Text(l10n.endLabel)),
                    Text(l10n.noEnd, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                  ],
                ),
              )
            else
              _TimeRow(
                title: l10n.endLabel,
                date: time.day(time.dateOf(end)),
                clock: time.timeMarked(end),
                onDate: () async {
                  final date = await pickLocalDate(context, initial: time.dateOf(end), today: time.today());
                  if (date != null) bloc.add(EntryFormEvent.endDateSet(date));
                },
                onClock: () async {
                  final picked = await pickWallTime(context, initial: time.math.wallTimeOf(end));
                  if (picked != null) bloc.add(EntryFormEvent.endTimeSet(picked));
                },
                trailing: [_SmallChip(text: l10n.endNow, onTap: () => bloc.add(const EntryFormEvent.endNowPressed()))],
              ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 56),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final d in _durations)
                    _SmallChip(text: time.duration(d), onTap: () => bloc.add(EntryFormEvent.durationPicked(d))),
                  FilterChip(
                    label: Text(l10n.noEndYet),
                    selected: end == null,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onSelected: (open) => bloc.add(EntryFormEvent.openEndToggled(open: open)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Problems (block saving), notices and the overlap warning (§6.6).
class FormMessages extends StatelessWidget {
  const FormMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = PlanyarColors.of(context);
    final time = TimeScope.of(context);
    return BlocBuilder<EntryFormBloc, EntryFormState>(
      buildWhen: (a, b) => a.check != b.check || a.overlaps != b.overlaps || a.labelId != b.labelId,
      builder: (context, state) {
        final messages = <Widget>[
          for (final problem in state.check.problems)
            _Message(icon: Icons.error_outline, color: theme.colorScheme.error, text: _problemText(l10n, problem)),
          if (state.check.notices.contains(EntryNotice.longEntry))
            _Message(icon: Icons.info_outline, color: theme.colorScheme.onSurfaceVariant, text: l10n.longEntryNotice),
          if (state.overlaps.isNotEmpty)
            Semantics(
              liveRegion: true,
              child: _Message(
                icon: Icons.warning_amber_rounded,
                color: colors.warning,
                text: [
                  l10n.overlapsWith(
                    state.labels[state.overlaps.first.labelId]?.name ?? l10n.unknownLabel,
                    time.range(state.overlaps.first.start, state.overlaps.first.end!),
                  ),
                  if (state.overlaps.length > 1) l10n.overlapsMore(state.overlaps.length - 1),
                ].join(' '),
              ),
            ),
          if (state.labelId == null)
            _Message(icon: Icons.label_outline, color: theme.colorScheme.onSurfaceVariant, text: l10n.pickLabelFirst),
        ];
        return Column(crossAxisAlignment: CrossAxisAlignment.start, spacing: 6, children: messages);
      },
    );
  }

  static String _problemText(AppLocalizations l10n, EntryProblem problem) => switch (problem) {
    EntryProblem.endNotAfterStart => l10n.problemEndNotAfterStart,
    EntryProblem.longerThanSevenDays => l10n.problemTooLong,
    EntryProblem.startOutOfRange => l10n.problemOutOfRange,
    EntryProblem.noteTooLong => l10n.problemNoteTooLong,
    EntryProblem.notMinuteAligned => l10n.errorGeneric,
  };
}

/// The full-width Save button.
class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final canSave = context.select((EntryFormBloc b) => b.state.canSave);
    final saving = context.select((EntryFormBloc b) => b.state.status == EntryFormStatus.saving);
    return FilledButton(
      onPressed: canSave && !saving
          ? () => context.read<EntryFormBloc>().add(const EntryFormEvent.savePressed())
          : null,
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
      child: Text(AppLocalizations.of(context).save),
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({
    required this.title,
    required this.date,
    required this.clock,
    required this.onDate,
    required this.onClock,
    required this.trailing,
  });

  final String title;
  final String date;
  final String clock;
  final VoidCallback onDate;
  final VoidCallback onClock;
  final List<Widget> trailing;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium?.copyWith(fontFeatures: const [FontFeature.tabularFigures()]);
    // Wraps the chips onto the next line on narrow screens or large text.
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(width: 56, child: Text(title)),
        TextButton(onPressed: onDate, child: Text(date)),
        TextButton(
          onPressed: onClock,
          child: Text(clock, style: style),
        ),
        ...trailing,
      ],
    );
  }
}

class _SmallChip extends StatelessWidget {
  const _SmallChip({required this.text, required this.onTap, this.tooltip});

  final String text;
  final String? tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.only(start: 4),
    child: ActionChip(
      label: Text(text),
      tooltip: tooltip,
      onPressed: onTap,
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
  );
}

class _Message extends StatelessWidget {
  const _Message({required this.icon, required this.color, required this.text});

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8,
    children: [
      Icon(icon, size: 20, color: color),
      Expanded(
        child: Text(text, style: TextStyle(color: color)),
      ),
    ],
  );
}
