import 'dart:ui';

import 'package:map_engine/visual/visual.dart';

final class ProjectedSketchPencil extends ProjectedPoint<MapSketchPencil> {
  ProjectedSketchPencil({required super.object, required super.worldPosition});

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final paint = Paint()..style = PaintingStyle.fill;

    return WorldScale([
      DrawCircle(center: worldPosition, radius: 8, paint: paint),
    ]);
  }
}
