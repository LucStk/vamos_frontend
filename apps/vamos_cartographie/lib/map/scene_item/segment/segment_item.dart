import 'package:map_canvas/map_canvas.dart';
import "package:map_engine/map_engine.dart";

import 'segment_style.dart';

final class SegmentItem extends LineItem<MapSegment> {
  SegmentItem({
    required super.object,
    required super.worldSegments,
    this.appearance = SegmentAppearance.fallback,
  });

  final SegmentAppearance appearance;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SegmentStyle.build(
    path,
    appearance,
    SegmentStyle.resolver.resolve(context),
  );
}
