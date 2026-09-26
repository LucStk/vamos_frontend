import 'package:map_canvas/map_canvas.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/map/features/trip_map/injection/editor_controller_provider.dart';
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
  print("object $objects");
  return objects;
}

@Riverpod(dependencies: [projectedTripEditorScene, MapEditor])
MapScene tripEditorScene(Ref ref, TripId tripId) {
  final selection = ref.watch(
    mapEditorProvider(tripId).select((m) => m.selection),
  );
  final projObjects = ref.watch(projectedTripEditorSceneProvider(tripId));
  return MapScene(selection: selection, objects: projObjects);
}
