import 'dart:ui';

import 'package:material_ui/material_ui.dart';

/// A dashed rounded-rectangle outline (planned entries, plan §12.3).
class DashedBorderPainter extends CustomPainter {
  const DashedBorderPainter({required this.color, this.radius = 8, this.width = 1.5, this.dash = 5, this.gap = 3});

  final Color color;
  final double radius;
  final double width;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset(width / 2, width / 2) & Size(size.width - width, size.height - width);
    final path = Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    for (final PathMetric metric in path.computeMetrics()) {
      for (var d = 0.0; d < metric.length; d += dash + gap) {
        canvas.drawPath(metric.extractPath(d, d + dash), paint);
      }
    }
  }

  @override
  bool shouldRepaint(DashedBorderPainter old) => old.color != color || old.width != width || old.radius != radius;
}
