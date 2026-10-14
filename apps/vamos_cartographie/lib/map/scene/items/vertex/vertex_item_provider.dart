import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/topology/injection/queries/vertex_queries.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_item.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_style.dart';

part 'vertex_item_provider.g.dart';

VertexVisualKind _visualKind(WaypointFields? waypoint) {
  if (waypoint == null) {
    return VertexVisualKind.normal;
  }

  return switch (waypoint.poiCategory) {
    PoiCategory.start => VertexVisualKind.start,
    PoiCategory.end => VertexVisualKind.end,
    _ => VertexVisualKind.normal,
  };
}

@Riverpod(keepAlive: true, dependencies: [])
({LatLng position, VertexVisualKind kind}) vertexData(
  Ref ref,
  TripId tripId,
  VertexId vertexId,
) {
  final wId = ref.watch(waypointFromVertexProvider(tripId, vertexId));
  final w = wId != null ? ref.watch(waypointProvider(tripId, wId)) : null;
  final position = ref.watch(
    vertexProvider(tripId, vertexId).select((v) => v.latLng),
  );
  return (position: position, kind: _visualKind(w));
}

@Riverpod(keepAlive: true, dependencies: [vertexData])
VertexItem vertexItem(
  Ref ref,
  TripId tripId,
  VertexId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(vertexDataProvider(tripId, id));
  return VertexItem(
    worldPosition: cameraReader.latLngToWorldOffset(d.position),
    object: MapVertex(tripId: tripId, id: id),
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
