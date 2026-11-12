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

/// Nombre maximal de segments (traits + vides) générés par contour. Au-delà
/// (pointillé minuscule à fort dézoom, contour très long), on dessine le
/// contour plein plutôt que de boucler des millions de fois.
const _maxSegmentsPerContour = 20000;

/// Découpe [source] selon [pattern] : [trait, vide, trait, vide...].
///
/// Un motif de longueur impaire est lu deux fois de suite (comme
/// `stroke-dasharray` en SVG), donc les rôles trait/vide s'inversent au
/// second passage. Un motif inutilisable (vide, valeur négative ou non
/// finie, somme nulle) laisse le tracé intact.
Path dashPath(Path source, List<double> pattern) {
  if (pattern.isEmpty ||
      pattern.any((v) => !v.isFinite || v < 0) ||
      pattern.every((v) => v == 0)) {
    return source;
  }

  // > 0 ici : valeurs >= 0, pas toutes nulles. Garantit que `distance`
  // avance d'au moins `cycle` à chaque tour de motif, donc que la boucle
  // se termine.
  final cycle = pattern.fold<double>(0, (sum, v) => sum + v);

  final out = Path();
  for (final metric in source.computeMetrics()) {
    final length = metric.length;

    if (length / cycle * pattern.length > _maxSegmentsPerContour) {
      out.addPath(metric.extractPath(0, length), Offset.zero);
      continue;
    }

    var distance = 0.0;
    var i = 0;
    while (distance < length) {
      final len = pattern[i % pattern.length];
      if (i.isEven) {
        out.addPath(
          metric.extractPath(distance, min(distance + len, length)),
          Offset.zero,
        );
      }
      distance += len;
      i++;
    }
  }
  return out;
}
