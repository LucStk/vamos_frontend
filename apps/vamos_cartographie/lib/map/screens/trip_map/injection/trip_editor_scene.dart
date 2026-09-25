import 'package:map_canvas/map_canvas.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';
import 'package:vamos_cartographie/map/screens/trip_map/injection/editor_controller_provider.dart';
import 'topology_projecter.dart';
import 'sketch_elements_projecter.dart';

part 'trip_editor_scene.g.dart';

@Riverpod(
  dependencies: [
    userLocationProjection,
    sketchElementProjection,
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

@Riverpod(dependencies: [projectedTripEditorScene])
MapScene tripEditorScene(Ref ref, TripId tripId) {
  final selection = ref.watch(
    editorModeProvider(tripId).select((m) => m.selection),
  );
  final projObjects = ref.watch(projectedTripEditorSceneProvider(tripId));
  return MapScene(selection: selection, objects: projObjects);
}
