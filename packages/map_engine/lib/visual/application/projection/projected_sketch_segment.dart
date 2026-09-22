import 'dart:ui';

import 'package:map_engine/visual/application/draw_command/draw_command_domain.dart';
import 'package:map_engine/visual/application/projection/base_objects/projected_object.dart';
import 'package:map_engine/visual/application/projection/map_paint_context.dart';
import 'package:map_engine/visual/domain/domain.dart';

final class ProjectedSketchSegment extends ProjectedLine<MapSketchSegment> {
  ProjectedSketchSegment({required super.object, required super.worldSegments});

  @override
  List<MapDrawCommand> describe({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final path = this.path;
    return [
      DrawPath(
        path: path,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      ),
    ];
  }
}
