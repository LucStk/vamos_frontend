import 'package:latlong2/latlong.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '../../../camera/injection/camera_or_null.dart';
import '/domain_features/domain_features.dart';
import "/map/map.dart";

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

@Riverpod(dependencies: [CameraOrNull, vertexData])
List<ProjectedPoint> allVertexProjection(Ref ref, TripId tripId) {
  final cameraReader = ref.watch(cameraOrNullProvider);
  if (cameraReader == null) return const [];

  return [
    for (final id in ref.watch(allVertexIdsProvider(tripId)))
      () {
        final d = ref.watch(vertexDataProvider(tripId, id));
        return ProjectedVertex(
          worldPosition: cameraReader.latLngToWorldOffset(d.position),
          object: MapVertex(id, d.position),
          visualKind: d.kind,
        );
      }(),
  ];
}

@Riverpod(dependencies: [CameraOrNull])
List<ProjectedLine> allSegmentProjection(Ref ref, TripId tripId) {
  final segments = ref.watch(allSegmentsProvider(tripId));
  final cameraReader = ref.watch(cameraOrNullProvider);
  if (cameraReader == null) {
    return [];
  }
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
