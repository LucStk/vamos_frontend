import 'dart:ui';

import 'package:map_engine/visual/application/draw_command/draw_command_domain.dart';
import 'package:map_engine/visual/application/projection/base_objects/projected_object.dart';
import 'package:map_engine/visual/application/projection/map_paint_context.dart';
import 'package:map_engine/visual/domain/domain.dart';

final class ProjectedUserLocation extends ProjectedPoint<MapUserLocation> {
  ProjectedUserLocation({required super.object, required super.worldPosition});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    // final accuracyPaint = Paint()..style = PaintingStyle.fill;
    // canvas.drawCircle(projectedPosition, point.accuracy, accuracyPaint);
    final positionPaint = Paint()..style = PaintingStyle.fill;
    return [DrawCircle(center: worldPosition, radius: 8, paint: positionPaint)];
  }
}
