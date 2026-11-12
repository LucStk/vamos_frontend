import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/injection.dart';
import 'package:vamos_cartographie/map/objects/waypoint/anchor_waypoint_item.dart';
import 'package:vamos_cartographie/map/objects/waypoint/chain_waypoint_item.dart';

part 'anchor_waypoint_item_provider.g.dart';

@Riverpod(keepAlive: true)
List<SceneItem> anchorWaypointItem(
  Ref ref,
  TripId tripId,
  WaypointId waypointId,
  MapCameraReader camera,
) {
  final waypoint = ref.watch(waypointProvider(tripId, waypointId));
  final polyline = ref.watch(routePolylineProvider(tripId, camera));
  if (polyline == null) return [];
  final anchorPos = polyline.pointAt(waypoint.anchorPosition);
  final waypointPos = camera.latLngToWorldOffset(waypoint.position);

  return [
    AnchorWaypointItem(
      object: MapWaypointAnchor(tripId: tripId, waypointId: waypointId),
      worldPosition: anchorPos,
    ),
    ChainWaypointItem(
      object: MapChainWaypoint(tripId: tripId, waypointId: waypointId),
      worldSegments: [(waypointPos, anchorPos)],
    ),
  ];
}

@Riverpod(keepAlive: true)
List<SceneItem> allWaypointAnchorItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      ...ref.watch(anchorWaypointItemProvider(tripId, id, camera)),
  ];
}
