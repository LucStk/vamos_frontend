import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import '/map/injection/map_mode.dart';
import '/map/injection/user_location_projecter.dart';
import 'topology_projecter.dart';
import 'sketch_elements_projecter.dart';

part 'trip_editor_scene.g.dart';

@Riverpod(
  dependencies: [
    sketchElementProjection,
    userLocationProjection,
    allVertexProjection,
    allSegmentProjection,
  ],
)
List<ProjectedObject> projectedTripEditorScene(Ref ref, TripId tripId) {
  final userLocation = ref.watch(userLocationProjectionProvider);
  final sketchElements = ref.watch(sketchElementProjectionProvider(tripId));
  final vertex = ref.watch(allVertexProjectionProvider(tripId));
  final segments = ref.watch(allSegmentProjectionProvider(tripId));

  final objects = [...userLocation, ...sketchElements, ...vertex, ...segments]
    ..sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return objects;
}

@Riverpod(dependencies: [projectedTripEditorScene, mapMode])
MapScene tripEditorScene(Ref ref, TripId tripId) {
  final selection = ref.watch(
    mapModeProvider.select(
      (m) => switch (m) {
        VertexSelectMode e => VertexSelected(e.vertexId),
        SegmentSelectMode e => SegmentSelected(e.segmentId),
        _ => null,
      },
    ),
  );

  final projObjects = ref.watch(projectedTripEditorSceneProvider(tripId));

  return MapScene(selection: selection, objects: projObjects);
}
