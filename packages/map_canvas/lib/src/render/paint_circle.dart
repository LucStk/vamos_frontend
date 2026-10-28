import 'package:map_canvas/src/domain/draw_command/draw_command.dart';
import 'package:map_canvas/src/render/paint_pass.dart';

void paintCircle(PaintPass p, DrawCircle c) {
  p.canvas.drawCircle(c.center.value, p.toWorld(c.radius), p.paintFor(c.style));
}
