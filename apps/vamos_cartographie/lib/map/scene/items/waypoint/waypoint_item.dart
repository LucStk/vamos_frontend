import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/scene/items/waypoint/waypoint_style.dart';

final class WaypointItem extends PointItem {
  WaypointItem({
    required this.object,
    required this.worldPosition,
    this.visualKind = WaypointVisualKind.normal,
  });

  @override
  final MapWaypoint object;
  @override
  final WorldOffset worldPosition;
  final WaypointVisualKind visualKind;

  /// Rayon du disque affiché (avant `look.scale`).
  @override
  final ScreenLength visualRadius = 9.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => WaypointStyle.build(
    worldPosition,
    WaypointStyle.of(visualKind).resolve(context),
    radius: visualRadius,
  );
}
