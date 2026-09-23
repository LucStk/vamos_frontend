import 'package:map_canvas/domain/projected_base_object/projected_object.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';
import 'topology_projecter.dart';
import 'sketch_elements_projecter.dart';

part 'trip_editor_scene.g.dart';

@riverpod
List<ProjectedObject> projectedTripEditorScene(Ref ref, TripId tripId) {
  final userLocation = ref.watch(userLocationProjectionProvider);
  final sketchElements = ref.watch(sketchElementProjectionProvider(tripId));
  final vertex = ref.watch(allVertexProjectionProvider(tripId));
  final segments = ref.watch(allSegmentProjectionProvider(tripId));

  final objects = [...userLocation, ...sketchElements, ...vertex, ...segments]
    ..sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));

  return objects;
}

@riverpod
MapScene tripEditorScene(Ref ref, TripId tripId) {
  final selection = ref.watch(
    editorModeProvider(tripId).select((m) => m.selection),
  );
  final projObjects = ref.watch(projectedTripEditorSceneProvider(tripId));
  return MapScene(selection: selection, objects: projObjects);
}
