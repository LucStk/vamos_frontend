// route/endpoint_style.dart
import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/route/endpoint_appearance.dart';

abstract final class EndpointStyle {
  static DrawCommand build(WorldOffset at, EndpointAppearance a) {
    final px = a.glyphPx;
    return DrawGroup([
      DrawAnchoredPath(
        anchor: at,
        path: GlyphPaths.anchored(a.glyph, sizePx: px),
        style: glyphPaintSpec(a.glyph, a.color, sizePx: px),
      ),
      if (a.dotColor != null)
        DrawCircle(center: at, radius: 3.px, style: Fill(a.dotColor!)),
    ]);
  }
}
