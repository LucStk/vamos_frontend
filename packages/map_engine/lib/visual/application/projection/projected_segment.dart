import 'dart:ui';

import 'package:map_engine/visual/application/draw_command/draw_command_domain.dart';
import 'package:map_engine/visual/application/projection/base_objects/projected_object.dart';
import 'package:map_engine/visual/application/projection/map_paint_context.dart';
import 'package:map_engine/visual/domain/domain.dart';

final class ProjectedSegment extends ProjectedLine<MapSegment> {
  ProjectedSegment({required super.object, required super.worldSegments});

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final path = this.path;
    final isSelected = context.state == MapObjectVisualState.selected;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 0.02 : 0.01
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    return ScreenScale([DrawPath(path: path, paint: paint)]);
  }
}
