import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

abstract final class SketchSegmentStyle {
  static const _color = Color(
    0xFF000000,
  ); // couleur par défaut de ton ancien Paint()
  static const _width = 5.0;

  static DrawCommand build(Path path) => DrawPath(
    path: path,
    style: Stroke(
      _color,
      width: _width.px,
      cap: StrokeCap.round,
      join: StrokeJoin.round,
    ),
  );
}

final class SketchSegmentItem extends LineItem<MapSketchSegment> {
  SketchSegmentItem({required super.object, required super.worldSegments});

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SketchSegmentStyle.build(path);
}
