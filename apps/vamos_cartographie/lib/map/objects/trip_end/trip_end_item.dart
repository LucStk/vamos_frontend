import 'package:domain_core/domain_core.dart';
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

final class TripEndItem extends PointItem {
  TripEndItem({required this.object, required this.worldPosition});

  @override
  final MapTripEnd object;

  @override
  final WorldOffset worldPosition;

  static const _poleColor = Color(0xFFA0692A); // vert foncé
  static const _flagColor = Color(0xFFA5AA2A); // vert
  static const _dotColor = Color(0xFF1B5E20);

  // Dimensions en px écran, origine (0,0) = pied du mât.
  static const _poleHeight = 22.0;

  static final Path _pole = Path()
    ..addRect(const Rect.fromLTRB(-1, -_poleHeight, 1, 0));

  static final Path _pennant = Path()
    ..moveTo(1, -_poleHeight)
    ..lineTo(14, -_poleHeight + 5.5)
    ..lineTo(1, -_poleHeight + 11)
    ..close();

  @override
  ScreenLength get visualRadius => 12.px;

  @override
  ScreenLength get hitRadius => 16.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    return DrawGroup([
      DrawAnchoredPath(
        anchor: worldPosition,
        path: _pole,
        style: Fill(_poleColor),
      ),
      DrawAnchoredPath(
        anchor: worldPosition,
        path: _pennant,
        style: Fill(_flagColor),
      ),
      // Point exact de départ, au pied du mât.
      DrawCircle(center: worldPosition, radius: 3.px, style: Fill(_dotColor)),
    ]);
  }
}
