import 'package:domain_core/domain_core.dart';
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

final class TripOriginItem extends PointItem {
  TripOriginItem({required this.object, required this.worldPosition});

  @override
  final MapTripOrigin object;

  @override
  final WorldOffset worldPosition;

  /// Demi-largeur du contour au repos (avant `look.widthScale`).
  @override
  ScreenLength get visualRadius => 8.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    return DrawCircle(
      center: worldPosition,
      radius: visualRadius,
      style: Fill(Color(0xFF000000)),
    );
  }
}
