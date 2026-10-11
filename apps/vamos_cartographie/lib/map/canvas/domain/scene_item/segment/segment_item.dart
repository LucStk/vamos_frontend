import 'package:map_canvas/map_canvas.dart';
import "package:map_engine/map_engine.dart";

import 'segment_style.dart';

final class SegmentItem extends LineItem {
  SegmentItem({
    required this.object,
    required this.worldSegments,
    this.appearance = SegmentAppearance.fallback,
  });

  final SegmentAppearance appearance;

  @override
  final MapTrip object; // voir remarque ci-dessous

  @override
  final List<WorldSegment> worldSegments;

  /// Demi-largeur du trait principal au repos (avant `look.widthScale`).
  @override
  ScreenLength get visualRadius => 3.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SegmentStyle.build(
    path,
    appearance,
    SegmentStyle.resolver.resolve(context),
    radius: visualRadius,
  );
}
