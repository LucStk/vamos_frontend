import 'dart:ui';

import 'package:domain_core/space/world_segment.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

abstract final class SketchSegmentStyle {
  static const _color = Color(
    0xFF000000,
  ); // couleur par défaut de ton ancien Paint()

  /// L'épaisseur vient de l'item : `radius * 2`.
  static DrawCommand build(Path path, {required ScreenLength radius}) =>
      DrawPath(
        path: path,
        style: Stroke(
          _color,
          width: (radius.value * 2).px,
          cap: StrokeCap.round,
          join: StrokeJoin.round,
        ),
      );
}

final class SketchSegmentItem extends LineItem {
  SketchSegmentItem({required this.object, required this.worldSegments});

  @override
  final MapSketchSegment object;

  @override
  final List<WorldSegment> worldSegments;

  /// Demi-largeur du trait (5 px de large au total).
  @override
  ScreenLength get visualRadius => 2.5.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SketchSegmentStyle.build(path, radius: visualRadius);
}
