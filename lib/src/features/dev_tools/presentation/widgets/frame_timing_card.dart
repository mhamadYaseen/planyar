import 'package:material_ui/material_ui.dart';

import '../../../../config/localization/l10n/generated/app_localizations.dart';
import '../../../../core/di/injection.dart';
import '../../domain/services/frame_stats.dart';
import '../frame_timing_recorder.dart';

/// Start → scroll Today / swipe days → come back → Stop (Phase 1 DoD check).
class FrameTimingCard extends StatefulWidget {
  const FrameTimingCard({super.key});

  @override
  State<FrameTimingCard> createState() => _FrameTimingCardState();
}

class _FrameTimingCardState extends State<FrameTimingCard> {
  final _recorder = sl<FrameTimingRecorder>();
  FrameStats? _result;

  String _ms(Duration d) => (d.inMicroseconds / 1000).toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = _result;
    return Card(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(l10n.devFrameTimingSection, style: Theme.of(context).textTheme.titleMedium),
            Text(_recorder.isRecording ? l10n.devFrameRecording : l10n.devFrameHint),
            if (result != null)
              Text(
                l10n.devFrameResult(
                  result.frames,
                  _ms(result.p50),
                  _ms(result.p90),
                  _ms(result.p99),
                  result.slowPercent.toStringAsFixed(1),
                ),
              ),
            OutlinedButton(
              onPressed: () => setState(() {
                if (_recorder.isRecording) {
                  _result = _recorder.stop();
                } else {
                  _result = null;
                  _recorder.start();
                }
              }),
              child: Text(_recorder.isRecording ? l10n.devFrameStop : l10n.devFrameStart),
            ),
          ],
        ),
      ),
    );
  }
}
