import 'dart:ui';

import 'package:map_canvas/domain/domain.dart';

import 'package:map_engine/map_engine.dart';
final class ProjectedUserLocation extends ProjectedPoint<MapUserLocation> {
  ProjectedUserLocation({required super.object, required super.worldPosition});

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    // final accuracyPaint = Paint()..style = PaintingStyle.fill;
    // canvas.drawCircle(projectedPosition, point.accuracy, accuracyPaint);
    final positionPaint = Paint()..style = PaintingStyle.fill;
    return ScreenScale([
      DrawCircle(center: worldPosition, radius: 8, paint: positionPaint),
    ]);
  }
}
