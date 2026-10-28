import 'dart:math';
import 'dart:ui';

import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/domain/paint_spec.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

void paintPath(PaintPass p, DrawPath c) {
  var path = c.path;
  if (c.style case Stroke(:final dash?) when dash.isNotEmpty) {
    path = dashPath(path, [for (final d in dash) p.toWorld(d)]);
  }
  p.canvas.drawPath(path, p.paintFor(c.style));
}

/// Découpe [source] selon [pattern] : [trait, vide, trait, vide...].
Path dashPath(Path source, List<double> pattern) {
  final out = Path();
  for (final metric in source.computeMetrics()) {
    var distance = 0.0;
    var i = 0;
    while (distance < metric.length) {
      final len = pattern[i % pattern.length];
      if (i.isEven) {
        out.addPath(
          metric.extractPath(distance, min(distance + len, metric.length)),
          Offset.zero,
        );
      }
      distance += len;
      i++;
    }
  }
  return out;
}
