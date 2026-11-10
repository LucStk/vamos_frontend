import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/segment/geometry/rounded_polyline.dart';

final class SelectionHighlightItem extends SceneItem {
  SelectionHighlightItem({required this.object, required this.points});

  @override
  final SelectionHighlight object;
  final List<WorldOffset> points;

  static const _color = Color(0x591565C0); // même bleu que les poignées, ~35 %

  // Plus large que le trait de la route (6,5 px), pour la déborder.
  static final _width = 14.px;

  @override
  ScreenLength get visualRadius => 7.px;
  @override
  ScreenLength get hitRadius => 0.px;

  // Jamais touchable : le hit-test saute cet item.
  @override
  bool get isHitTestable => false;

  @override
  bool isHitAt(WorldOffset p, double zoomScale) => false;
  @override
  WorldOffset hitPoint(WorldOffset p) => points.first;

  late final Path _path = roundedPolylinePath([
    for (var i = 0; i < points.length - 1; i++) (points[i], points[i + 1]),
  ], radius: 12.0);

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => DrawPath(
    path: _path,
    style: Stroke(
      _color,
      width: _width,
      cap: StrokeCap.round,
      join: StrokeJoin.round,
    ),
  );
}
