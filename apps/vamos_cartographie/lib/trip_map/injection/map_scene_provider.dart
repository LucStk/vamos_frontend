import 'package:map_canvas/domain/domain.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:trip_application/waypoint/waypoint.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/user_location/user_location.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_queries.dart';
part 'map_scene_provider.g.dart';

// final projection = const Epsg3857().projection;

@Riverpod(keepAlive: true)
ProjectedScene projectedScene(Ref ref, TripId tripId) {
  final sketchSegment = ref.watch(projectSketchSegmentProvider(tripId));
  final sketchPencil = ref.watch(projectSketchPencilProvider(tripId));
  final userLocation = ref.watch(projectUserLocationProvider);

  final objects = <ProjectedObject>[
    ...?ref.watch(projectVertexProvider(tripId)),
    ...?ref.watch(projectSegmentProvider(tripId)),
    if (sketchSegment case final segment?) segment,
    if (sketchPencil case final pencil?) pencil,
    if (userLocation case final location?) location,
  ];
  objects.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return ProjectedScene(objects);
}

@riverpod
MapScene mapScene(Ref ref, TripId tripId) {
  final projectedScene = ref.watch(projectedSceneProvider(tripId));
  final selection = ref.watch(
    tripMapStateProvider(tripId).select((m) => m.selection),
  );
  return MapScene(projectedScene: projectedScene, selection: selection);
}

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
  final cameraReader = ref.read(mapCameraReaderProvider);
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
  final cameraReader = ref.read(mapCameraReaderProvider);
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

@riverpod
ProjectedLine? projectSketchSegment(Ref ref, TripId tripId) {
  final editorState = ref.watch(tripMapStateProvider(tripId));

  final cameraReader = ref.read(mapCameraReaderProvider);
  if (editorState case final SketchMode sketch) {
    return ProjectedSketchSegment(
      object: MapSketchSegment(sketch.path),
      worldPoints: sketch.path
          .map((p) => cameraReader.latLngToWorldOffset(p))
          .toList(),
    );
  }
  return null;
}

@riverpod
ProjectedPoint? projectSketchPencil(Ref ref, TripId tripId) {
  final editorState = ref.watch(tripMapStateProvider(tripId));

  final cameraReader = ref.read(mapCameraReaderProvider);
  if (editorState case final SketchMode sketch) {
    final position = sketch.pencilPositionOrNull;
    if (position != null) {
      return ProjectedSketchPencil(
        object: MapSketchPencil(position),
        worldPosition: cameraReader.latLngToWorldOffset(position),
      );
    }
  }
  return null;
}

@riverpod
ProjectedPoint? projectUserLocation(Ref ref) {
  final location = ref.watch(userLocationProvider);
  final cameraReader = ref.read(mapCameraReaderProvider);

  if (location case final UserPositionActive activeLocation) {
    return ProjectedUserLocation(
      object: MapUserLocation(
        activeLocation.position,
        accuracy: activeLocation.accuracy,
        heading: activeLocation.heading,
      ),
      worldPosition: cameraReader.latLngToWorldOffset(activeLocation.position),
    );
  }
  return null;
}
