import 'dart:ui';

import 'package:domain_core/space/world_segment.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';

abstract final class SketchSegmentStyle {
  /// Gris graphite : les alphas faibles se cumulent là où les calques se croisent.
  static const _light = Color(0x4D6E6E6E); // ~30 %
  static const _mid = Color(0x8C555555); // ~55 %
  static const _dark = Color(0xB3383838); // ~70 %

  /// L'épaisseur vient de l'item : `radius * 2`.
  /// Trois calques de largeurs et de motifs de hachures différents.
  static DrawCommand build(Path path, {required ScreenLength radius}) {
    final w = radius.value * 2;

    DrawCommand layer(Color color, double width, List<double> dashPx) =>
        DrawPath(
          path: path,
          style: Stroke(
            color,
            width: width.px,
            cap: StrokeCap.butt, // round fusionnerait les hachures
            join: StrokeJoin.round,
            dash: [for (final d in dashPx) d.px],
          ),
        );

    return DrawGroup([
      layer(_light, w, [4, 2]), // fond large, hachures courtes
      layer(_mid, w * 0.7, [2, 3]), // trait moyen, plus aéré
      layer(_dark, w * 0.3, [7, 3, 1.5, 3]), // fin, irrégulier : le "grain"
    ]);
  }
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
