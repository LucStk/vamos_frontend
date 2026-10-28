import 'dart:typed_data';

import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/render/paint_path.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

void paintAnchoredPath(PaintPass p, DrawAnchoredPath c) {
  final s = 1.0 / p.zoomScale!;
  final a = c.anchor.value;

  // Échelle 1/zoom + translation vers l'ancre (matrice 4x4 colonne-major).
  final m = Float64List.fromList([
    s, 0, 0, 0, //
    0, s, 0, 0,
    0, 0, 1, 0,
    a.dx, a.dy, 0, 1,
  ]);

  paintPath(p, DrawPath(path: c.path.transform(m), style: c.style));
}
