import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/map/scene/items/waypoint/waypoint_item.dart';
import 'package:vamos_cartographie/map/scene/items/waypoint/waypoint_style.dart';

part 'waypoint_item_provider.g.dart';

WaypointVisualKind _visualKind(WaypointFields? waypoint) {
  if (waypoint == null) {
    return WaypointVisualKind.normal;
  }

  return switch (waypoint.poiCategory) {
    PoiCategory.start => WaypointVisualKind.start,
    PoiCategory.end => WaypointVisualKind.end,
    _ => WaypointVisualKind.normal,
  };
}

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
    visualKind: _visualKind(d),
  );
}

@Riverpod(keepAlive: true, dependencies: [waypointItem])
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
