import 'package:domain_core/space/world_segment.dart';
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
    this.appearance = SegmentAppearance.fallback,
  });

  final SegmentAppearance appearance;

  @override
  final MapMobilitySpan object; // voir remarque ci-dessous

  @override
  final List<WorldSegment> worldSegments;

  /// Demi-largeur du trait principal au repos (avant `look.widthScale`).
  @override
  ScreenLength get visualRadius => 3.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

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
