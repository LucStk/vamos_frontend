import 'dart:ui';

import 'package:map_engine/visual/application/draw_command/draw_command_domain.dart';
import 'package:map_engine/visual/application/projection/base_objects/projected_object.dart';
import 'package:map_engine/visual/application/projection/map_paint_context.dart';
import 'package:map_engine/visual/domain/domain.dart';

final class ProjectedSketchPencil extends ProjectedPoint<MapSketchPencil> {
  ProjectedSketchPencil({required super.object, required super.worldPosition});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final paint = Paint()..style = PaintingStyle.fill;

    return [DrawCircle(center: worldPosition, radius: 8, paint: paint)];
  }
}
