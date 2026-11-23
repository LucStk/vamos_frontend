import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart';
import 'package:vamos_cartographie/map/objects/waypoint/waypoint_item.dart';

part 'waypoint_item_provider.g.dart';

@Riverpod(keepAlive: true)
WaypointItem waypointItem(
  Ref ref,
  TripId tripId,
  WaypointId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(waypointProvider(tripId, id));
  // L'épingle penche à l'écart de la route, d'après sa tangente à l'ancre du
  // waypoint.
  final polyline = ref.watch(routePolylineProvider(tripId, cameraReader));
  return WaypointItem(
    worldPosition: cameraReader.latLngToWorldOffset(d.position),
    object: MapWaypoint(tripId: tripId, id: id),
    kindStyle: d.display,
    direction: polyline == null
        ? WaypointItem.upright
        : WaypointItem.pinDirection(polyline.angleAt(d.anchorPosition)),
  );
}

@Riverpod(keepAlive: true)
List<PointItem> allWaypointItem(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      ref.watch(waypointItemProvider(tripId, id, camera)),
  ];
}

/// Les waypoints au second plan : sous la route, presque transparents. Pour
/// les scènes où ils ne servent que de repère ; [except] reste à part.
///
/// Fonction simple (pas de génération) : sans `build_runner`.
List<PointItem> backgroundWaypointItems(
  Ref ref,
  TripId tripId,
  MapCameraReader camera, {
  WaypointId? except,
}) {
  return [
    for (final id in ref.watch(allWaypointIdsProvider(tripId)))
      if (id != except)
        ref.watch(waypointItemProvider(tripId, id, camera)).asBackground(),
  ];
}
