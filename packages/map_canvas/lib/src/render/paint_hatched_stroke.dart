import 'dart:math';
import 'dart:ui';

import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

/// Garde-fou : au-delà, on ne dessine que le trait plein.
const _maxHatchLines = 3000;

void paintHatchedStroke(PaintPass p, DrawHatchedStroke c) {
  final canvas = p.canvas;
  final z = p.zoomScale!;
  final w = c.widthPx / z;
  final edge = c.edgePx / z;

  // Zone de travail : emprise du trait, limitée à ce qui est visible.
  final bounds = c.path.getBounds().inflate(w / 2 + 1 / z);
  final visible = canvas.getLocalClipBounds();
  final area = visible.isFinite ? bounds.intersect(visible) : bounds;
  if (area.isEmpty) return;

  canvas.saveLayer(area, p.layerPaint);

  // Trait plein : contour sombre, puis remplissage clair un peu plus fin.
  final stroke = p.strokePaint
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..isAntiAlias = true;
  canvas.drawPath(
    c.path,
    stroke
      ..color = c.edgeColor
      ..strokeWidth = w,
  );
  canvas.drawPath(
    c.path,
    stroke
      ..color = c.fillColor
      ..strokeWidth = max(w - 2 * edge, 0),
  );

  // Barres "/" : droites x + y = k * step + phase.
  // step = pas perpendiculaire (spacingPx) converti sur l'axe x + y (× √2).
  final step = c.spacingPx / z * sqrt2;
  // Modulo : la phase ne dérive pas, et reste dans [0, step[.
  final phase = (c.hatchPhasePx / z * sqrt2) % step;
  // kMin - 1 : une barre de plus à gauche, sinon un vide apparaît au bord
  // à mesure que la phase avance.
  final kMin = ((area.left + area.top) / step).floor() - 1;
  final kMax = ((area.right + area.bottom) / step).ceil();

  if (kMax - kMin <= _maxHatchLines) {
    final lines = Path();
    for (var k = kMin; k <= kMax; k++) {
      final s = k * step + phase;
      lines
        ..moveTo(area.left, s - area.left)
        ..lineTo(area.right, s - area.right);
    }
    canvas.drawPath(
      lines,
      p.hatchPaint
        ..style = PaintingStyle.stroke
        ..strokeWidth = c.hatchWidthPx / z
        ..color = c.hatchColor
        ..isAntiAlias = true
        ..blendMode = BlendMode.srcATop, // seulement là où le trait existe
    );
  }

  canvas.restore();
}
