import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

/// Le chemin est déjà en pixels, (0, 0) sur l'ancre : il se dessine tel quel
/// dans l'espace écran. Le ramener en unités monde le quantifierait, voir
/// [PaintPass.inScreenSpace].
void paintAnchoredPath(PaintPass p, DrawAnchoredPath c) {
  p.inScreenSpace(
    c.anchor.value,
    () => p.canvas.drawPath(c.path, p.pxPaintFor(c.style)),
  );
}
