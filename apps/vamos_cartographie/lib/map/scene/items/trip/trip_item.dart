import 'package:domain_core/space/world_segment.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'trip_style.dart';

final class TripItem extends PolylineItem {
  TripItem({required this.object, required this.worldSegments});

  @override
  final MapTrip object;

  @override
  final List<List<WorldSegment>> worldSegments;

  /// Demi-largeur du contour au repos (avant `look.widthScale`).
  @override
  ScreenLength get visualRadius => 2.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => TripStyle.build(
    path,
    TripStyle.resolver.resolve(context),
    radius: visualRadius,
  );
}
