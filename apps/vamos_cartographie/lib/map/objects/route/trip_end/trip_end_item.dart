import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/trip_start/trip_start_appearances.dart';

final class TripEndItem extends PointItem {
  TripEndItem({required this.object, required this.worldPosition});

  @override
  final MapTripEnd object;
  @override
  final WorldOffset worldPosition;

  static const _glyphPx = 24.0;

  @override
  ScreenLength get visualRadius => 12.px;
  @override
  ScreenLength get hitRadius => 16.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final a = EndpointAppearances.end;
    return DrawGroup([
      DrawAnchoredPath(
        anchor: worldPosition,
        path: GlyphPaths.anchored(a.glyph, sizePx: _glyphPx),
        style: glyphPaintSpec(a.glyph, a.color, sizePx: _glyphPx),
      ),
      // Point exact d'arrivée, au pied du mât.
      DrawCircle(center: worldPosition, radius: 3.px, style: Fill(a.dotColor)),
    ]);
  }
}
