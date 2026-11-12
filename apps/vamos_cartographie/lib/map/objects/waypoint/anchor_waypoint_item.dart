import 'package:domain_core/domain_core.dart';

import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/objects/waypoint/style/waypoint_style.dart';

final class AnchorWaypointItem extends PointItem {
  AnchorWaypointItem({
    required this.object,
    required this.worldPosition,

    required this.polyline,
    this.visualKind = WaypointVisualKind.end,
  });

  @override
  final MapWaypointAnchor object;
  @override
  final WorldOffset worldPosition;
  final WaypointVisualKind visualKind;
  final RoutePolyline polyline;

  /// Rayon du disque affiché (avant `look.scale`).
  @override
  final ScreenLength visualRadius = 9.px;

  @override
  ScreenLength get hitRadius => 14.px;
  @override
  DragDetail? dragDetail(WorldOffset p) => RouteDragDetail(polyline.project(p));

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => WaypointStyle.build(
    worldPosition,
    WaypointStyle.of(visualKind).resolve(context),
    radius: visualRadius,
  );
}
