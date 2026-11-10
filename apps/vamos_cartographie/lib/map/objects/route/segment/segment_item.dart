import 'package:domain_core/domain_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:map_canvas/map_canvas.dart';
import "package:map_engine/map_engine.dart";
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/geometry/rounded_polyline.dart';
import 'package:vamos_cartographie/map/objects/route/segment/style/segment_style.dart';

final class SegmentItem extends LineItem {
  SegmentItem({
    required this.object,
    required this.worldSegments,
    required this.polyline,
    required this.endIndex,
    this.appearance = SegmentAppearance.fallback,
    this.context = const MapPaintContext(),
  });

  final SegmentAppearance appearance;
  final MapPaintContext context;

  final RoutePolyline polyline;

  final int endIndex;

  @override
  final MapMobilitySpan object; // voir remarque ci-dessous

  @override
  final List<WorldSegment> worldSegments;

  /// Demi-largeur du trait principal au repos (avant `look.widthScale`).
  @override
  ScreenLength get visualRadius => 3.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  HitDetail? hitDetail(WorldOffset p) {
    final d = RouteHitDetail(
      polyline.project(
        p,
        min: object.spanStartIndex.toDouble(),
        max: endIndex.toDouble(),
      ),
    );
    return d;
  }

  @override
  DragDetail? dragDetail(WorldOffset p) => RouteDragDetail(polyline.project(p));

  static const _cornerRadius = 12.0; // unités monde, à régler à l'œil

  late final Path _roundedPath = roundedPolylinePath(
    worldSegments,
    radius: _cornerRadius,
  );

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => DrawGroup([
    SegmentStyle.build(
      _roundedPath, // ← au lieu de `path`
      appearance,
      SegmentStyle.resolver.resolve(context),
      radius: visualRadius,
    ),
  ]);
}
