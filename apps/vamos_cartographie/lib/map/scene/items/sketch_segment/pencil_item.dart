import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

final class PencilItem extends PointItem {
  PencilItem({required this.object, required this.worldPosition});

  @override
  final MapSketchPencil object;

  @override
  final WorldOffset worldPosition;
  @override
  final ScreenLength visualRadius = 9.px;

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
