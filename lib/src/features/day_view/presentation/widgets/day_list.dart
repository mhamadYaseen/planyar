import 'package:material_ui/material_ui.dart';

import '../../../entries/domain/entities/entry.dart';
import '../bloc/day_view_bloc.dart';
import 'entry_list_tile.dart';

/// List mode (VIEW-01): the day's entries in order; overnight entries from
/// yesterday come first (§6.3).
class DayList extends StatelessWidget {
  const DayList({required this.view, required this.onEntryTap, required this.onSetEnd, super.key});

  final DayView view;
  final ValueChanged<Entry> onEntryTap;
  final ValueChanged<Entry> onSetEnd;

  @override
  Widget build(BuildContext context) {
    final segments = [...view.layout.segments]
      ..sort((a, b) {
        final byStart = a.startMinute.compareTo(b.startMinute);
        return byStart != 0 ? byStart : a.entry.kind.index.compareTo(b.entry.kind.index);
      });
    return ListView.builder(
      padding: const EdgeInsetsDirectional.only(top: 4, bottom: 88),
      itemCount: segments.length,
      itemBuilder: (context, i) {
        final segment = segments[i];
        return EntryListTile(
          key: ValueKey(segment.entry.id),
          segment: segment,
          label: view.labels[segment.entry.labelId],
          onTap: () => onEntryTap(segment.entry),
          onSetEnd: segment.isOpen ? () => onSetEnd(segment.entry) : null,
        );
      },
    );
  }
}
