import 'dart:ui';

import 'package:map_canvas/domain/domain.dart';
import 'package:map_engine/map_engine.dart';

final class ProjectedSketchSegment extends ProjectedLine<MapSketchSegment> {
  ProjectedSketchSegment({required super.object, required super.worldSegments});

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final path = this.path;
    return ScreenScale([
      DrawPath(
        path: path,
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      ),
    ]);
  }
}
