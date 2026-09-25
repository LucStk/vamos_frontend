import 'dart:ui';

import 'package:map_canvas/domain/domain.dart';
import "package:map_engine/map_engine.dart";

final class ProjectedSegment extends ProjectedLine<MapSegment> {
  ProjectedSegment({required super.object, required super.worldSegments});

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final path = this.path;
    final isSelected = context.state == MapObjectVisualState.selected;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 10 : 20
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    return ScreenScale([DrawPath(path: path, paint: paint)]);
  }
}
