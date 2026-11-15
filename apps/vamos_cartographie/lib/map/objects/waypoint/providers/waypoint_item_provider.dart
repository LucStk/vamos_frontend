import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
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
  return WaypointItem(
    worldPosition: cameraReader.latLngToWorldOffset(d.position),
    object: MapWaypoint(tripId: tripId, id: id),
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
