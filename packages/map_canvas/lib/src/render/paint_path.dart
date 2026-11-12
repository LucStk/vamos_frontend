import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/domain/length.dart';
import 'package:map_canvas/src/domain/paint_spec.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

void paintPath(PaintPass p, DrawPath c) {
  final style = c.style;

  if (style is Stroke) {
    final dash = style.dash;
    if (dash != null && dash.isNotEmpty) {
      if (p.isDependent) {
        _paintDashedInPixels(p, c.path, style, dash);
      } else {
        // Passe invariante : motif et épaisseur sont déjà en unités monde.
        final dashed = dashPath(c.path, [for (final d in dash) p.toWorld(d)]);
        p.canvas.drawPath(dashed, p.paintFor(style));
      }
      return;
    }
  }

  p.canvas.drawPath(c.path, p.paintFor(style));
}

/// Pointille [path] en pixels écran, autour d'une origine locale.
///
/// En unités monde, un motif de 8 px vaut `8 / zoomScale` : à fort zoom c'est
/// un nombre minuscule, à comparer à des coordonnées monde bien plus grandes
/// (Skia travaille en float32). Les points des tirets s'arrondissent alors
/// aux mêmes valeurs : ils se déforment, puis disparaissent. Ici on ramène
/// d'abord le tracé près de (0, 0), puis on le met à l'échelle : le motif
/// et l'épaisseur restent des nombres de l'ordre du pixel.
void _paintDashedInPixels(
  PaintPass p,
  Path path,
  Stroke style,
  List<Length> dash,
) {
  final z = p.zoomScale!;
  final canvas = p.canvas;

  double toPx(Length l) => switch (l) {
    ScreenLength(:final value) => value,
    WorldLength(:final value) => value * z,
  };

  // Zone concernée : emprise du trait ∩ zone visible (comme paintHatchedStroke).
  final bounds = path.getBounds().inflate(p.toWorld(style.width) / 2 + 1 / z);
  final visible = canvas.getLocalClipBounds();
  final area = visible.isFinite ? bounds.intersect(visible) : bounds;
  if (area.isEmpty) return;

  // Origine locale. Deux opérations séparées, dans cet ordre : une seule
  // matrice (scale + translate) additionnerait deux grands nombres de signes
  // opposés et perdrait toute précision.
  final origin = area.center;
  final pixelPath = path.shift(-origin).transform(_uniformScale(z));

  final dashed = dashPath(pixelPath, [for (final d in dash) toPx(d)]);

  canvas.save();
  canvas.translate(origin.dx, origin.dy);
  canvas.scale(1 / z); // 1 unité = 1 pixel écran
  canvas.drawPath(dashed, p.paintFor(style)..strokeWidth = toPx(style.width));
  canvas.restore();
}

Float64List _uniformScale(double s) => Float64List(16)
  ..[0] = s
  ..[5] = s
  ..[10] = 1
  ..[15] = 1;

/// Nombre maximal de segments (traits + vides) générés par contour. Au-delà
/// (pointillé minuscule, contour très long), on dessine le contour plein
/// plutôt que de boucler des millions de fois.
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
