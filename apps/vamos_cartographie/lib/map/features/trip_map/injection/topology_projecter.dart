import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/injection/injection.dart';
import '/domain_features/domain_features.dart';

part 'topology_projecter.g.dart';

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

@Riverpod(dependencies: [mapContext])
List<ProjectedPoint> allVertexProjection(Ref ref, TripId tripId) {
  final vertices = ref.watch(allVertexProvider(tripId));
  final cameraReader = ref.read(mapContextProvider).camera;
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

@Riverpod(dependencies: [mapContext])
List<ProjectedLine> allSegmentProjection(Ref ref, TripId tripId) {
  final segments = ref.watch(allSegmentsProvider(tripId));
  final cameraReader = ref.read(mapContextProvider).camera;

  return [
    for (final segment in segments)
      ProjectedSegment(
        worldSegments: projectLine(
          segment.geometry,
          cameraReader.latLngToWorldOffset,
        ),
        object: MapSegment(segment.id, segment.geometry),
      ),
  ];
}
