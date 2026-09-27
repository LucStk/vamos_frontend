import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import "package:map_engine/map_engine.dart";

final class ProjectedSegment extends ProjectedLine<MapSegment> {
  ProjectedSegment({required super.object, required super.worldSegments});

  static const _strokeWidths = <MapObjectVisualState, double>{
    MapObjectVisualState.normal: 4,
    MapObjectVisualState.selected: 10,
    MapObjectVisualState.hovered: 6,
    MapObjectVisualState.dragging: 12,
  };

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final width = lerpDouble(
      _strokeWidths[context.from]!,
      _strokeWidths[context.state]!,
      context.t,
    )!;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    return ScreenScale([DrawPath(path: path, paint: paint)]);
  }
}
