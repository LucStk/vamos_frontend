import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

final class PencilItem extends PointItem<MapSketchPencil> {
  PencilItem({required super.object, required super.worldPosition});

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    return DrawCircle(
      center: worldPosition,
      radius: 8.px,
      style: Fill(Color(0xFF000000)),
    );
  }
}
