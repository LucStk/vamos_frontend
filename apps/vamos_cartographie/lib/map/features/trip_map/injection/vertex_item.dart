import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '../../../../domain_features/topology/injection/queries/vertex_queries.dart';
import '../../../../domain_features/waypoint/injection/injection.dart';
import '../../../canvas/domain/scene_item/vertex/vertex_item.dart';
import '../../../canvas/domain/scene_item/vertex/vertex_style.dart';

part 'vertex_item.g.dart';

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

@Riverpod(dependencies: [])
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

@Riverpod(dependencies: [vertexData])
VertexItem vertexItem(
  Ref ref,
  TripId tripId,
  VertexId id,
  MapCameraReader cameraReader,
) {
  final d = ref.watch(vertexDataProvider(tripId, id));
  return VertexItem(
    worldPosition: cameraReader.latLngToWorldOffset(d.position),
    object: MapVertex(id, d.position),
    visualKind: d.kind,
  );
}
