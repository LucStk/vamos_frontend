import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

final class ProjectedSketchSegment extends LineItem<MapSketchSegment> {
  ProjectedSketchSegment({required super.object, required super.worldSegments});

  @override
  DrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
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
