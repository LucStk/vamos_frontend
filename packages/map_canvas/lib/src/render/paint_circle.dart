import 'dart:ui';

import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/domain/length.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

void paintCircle(PaintPass p, DrawCircle c) {
  // Rayon en pixels : on dessine dans l'espace écran, sinon le cercle se
  // quantifie à fort zoom (voir [PaintPass.inScreenSpace]).
  if (c.radius case ScreenLength(:final value) when p.isDependent) {
    p.inScreenSpace(
      c.center.value,
      () => p.canvas.drawCircle(Offset.zero, value, p.pxPaintFor(c.style)),
    );
    return;
  }

  p.canvas.drawCircle(c.center.value, p.toWorld(c.radius), p.paintFor(c.style));
}
