import 'dart:ui';

import 'package:domain_core/space/world_segment.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

abstract final class SketchSegmentStyle {
  static const _fill = Color(0xFFF2F2F2); // papier
  static const _edge = Color(0xFF4A4A4A); // contour
  static const _hatch = Color(0xFF8C8C8C); // barres grises

  /// L'épaisseur vient de l'item : `radius * 2`.
  static DrawCommand build(Path path, {required ScreenLength radius}) =>
      DrawHatchedStroke(
        path: path,
        widthPx: radius.value,
        fillColor: _fill,
        edgeColor: _edge,
        hatchColor: _hatch,
      );
}

final class SketchSegmentItem extends LineItem {
  SketchSegmentItem({required this.object, required this.worldSegments});

  @override
  final MapSketchSegment object;

  @override
  final List<WorldSegment> worldSegments;

  /// Demi-largeur du trait (10 px au total) : il faut un peu de place
  /// pour que les hachures se lisent.
  @override
  ScreenLength get visualRadius => 5.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SketchSegmentStyle.build(path, radius: visualRadius);
}
