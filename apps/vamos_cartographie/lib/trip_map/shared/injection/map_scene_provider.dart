import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:trip_application/waypoint/waypoint.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/user_location/user_location.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_queries.dart';

import 'package:vamos_cartographie/base_map/base_map.dart';
part 'map_scene_provider.g.dart';

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

@riverpod
List<ProjectedPoint> projectVertex(Ref ref, TripId tripId) {
  final vertices = ref.watch(allVertexProvider(tripId));
  final cameraReader = ref.read(mapCameraHolderProvider);
  final List<ProjectedPoint> ret = [];
  for (final vertex in vertices) {
    final wId = ref.watch(waypointFromVertexProvider(tripId, vertex.id));
    final w = (wId != null) ? ref.watch(waypointProvider(tripId, wId)) : null;
    ret.add(
      ProjectedVertex(
        worldPosition: cameraReader.latLngToWorldOffset(vertex.latLng),

        object: MapVertex(vertex.id, vertex.latLng),
        visualKind: _visualKind(w),
      ),
    );
  }
  return ret;
}

@riverpod
List<ProjectedLine> projectSegment(Ref ref, TripId tripId) {
  final segments = ref.watch(allSegmentsProvider(tripId));
  final cameraReader = ref.read(mapCameraHolderProvider);
  return [
    for (final segment in segments)
      ProjectedSegment(
        worldPoints: segment.geometry
            .map((p) => cameraReader.latLngToWorldOffset(p))
            .toList(),
        object: MapSegment(segment.id, segment.geometry),
      ),
  ];
}
