import 'package:map_application/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/injection/map_camera_provider.dart';
import 'package:vamos_cartographie/map/injection/map_editor_state.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/user_location/user_location.dart';

part 'map_scene_provider.g.dart';

@riverpod
List<ProjectedPoint> projectVertex(Ref ref, TripId tripId) {
  final camera = ref.watch(mapCameraReaderProvider);
  final vertices = ref.watch(allVertexProvider(tripId));

  return [
    for (final vertex in vertices)
      ProjectedVertex(
        object: MapVertex(vertex.id, vertex.latLng),
        camera: camera,
      ),
  ];
}

@riverpod
List<ProjectedLine> projectSegment(Ref ref, TripId tripId) {
  final camera = ref.watch(mapCameraReaderProvider);
  final segments = ref.watch(allSegmentsProvider(tripId));

  return [
    for (final segment in segments)
      ProjectedSegment(
        object: MapSegment(segment.id, segment.geometry),
        camera: camera,
      ),
  ];
}

@riverpod
ProjectedLine? projectSketchSegment(Ref ref, TripId tripId) {
  final camera = ref.watch(mapCameraReaderProvider);
  final editorState = ref.watch(mapEditorStateProvider(tripId));

  if (editorState case final SketchMode sketch) {
    final geometry = sketch.sketchSegmentGeometryOrNull;
    if (geometry != null) {
      return ProjectedSketchSegment(
        object: MapSketchSegment(geometry),
        camera: camera,
      );
    }
  }
  return null;
}

@riverpod
ProjectedPoint? projectSketchPencil(Ref ref, TripId tripId) {
  final camera = ref.watch(mapCameraReaderProvider);
  final editorState = ref.watch(mapEditorStateProvider(tripId));

  if (editorState case final SketchMode sketch) {
    final position = sketch.pencilPositionOrNull;
    if (position != null) {
      return ProjectedSketchPencil(
        object: MapSketchPencil(position),
        camera: camera,
      );
    }
  }
  return null;
}

@riverpod
ProjectedPoint? projectUserLocation(Ref ref) {
  final camera = ref.watch(mapCameraReaderProvider);
  final location = ref.watch(userLocationProvider);

  if (location case final UserPositionActive activeLocation) {
    return ProjectedUserLocation(
      object: MapUserLocation(
        activeLocation.position,
        accuracy: activeLocation.accuracy,
        heading: activeLocation.heading,
      ),
      camera: camera,
    );
  }
  return null;
}

@riverpod
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
