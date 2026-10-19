import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';

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

@Riverpod(keepAlive: true, dependencies: [])
({LatLng position, WaypointVisualKind kind}) vertexData(
  Ref ref,
  TripId tripId,
  WaypointId vertexId,
) {
  final wId = ref.watch(waypointFromVertexProvider(tripId, vertexId));
  final w = wId != null ? ref.watch(waypointProvider(tripId, wId)) : null;
  final position = ref.watch(
    vertexProvider(tripId, vertexId).select((v) => v.latLng),
  );
  return (position: position, kind: _visualKind(w));
}

@Riverpod(keepAlive: true, dependencies: [vertexData])
WaypointItem vertexItem(
  Ref ref,
  TripId tripId,
  WaypointId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(vertexDataProvider(tripId, id));
  return WaypointItem(
    worldPosition: cameraReader.latLngToWorldOffset(d.position),
    object: MapWaypoint(tripId: tripId, id: id),
    visualKind: d.kind,
  );
}

@Riverpod(keepAlive: true, dependencies: [vertexItem])
List<PointItem> allVertexItem(Ref ref, TripId tripId, MapCameraReader camera) {
  return [
    for (final id in ref.watch(allVertexIdsProvider(tripId)))
      ref.watch(vertexItemProvider(tripId, id, camera)),
  ];
}
