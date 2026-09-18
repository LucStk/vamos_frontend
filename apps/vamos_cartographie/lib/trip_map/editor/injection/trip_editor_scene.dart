import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/trip_map/editor/injection/injection.dart';
import 'package:vamos_cartographie/trip_map/injection/topology_projecter.dart';

import 'package:vamos_cartographie/base_map/base_map.dart';
part 'trip_editor_scene.g.dart';

@riverpod
ProjectedScene projectedTripEditorScene(Ref ref, TripId tripId) {
  final userLocation = ref.watch(userLocationProjectionProvider);
  final sketchElements = ref.watch(sketchElementProjectionProvider(tripId));
  final vertex = ref.watch(allVertexProjectionProvider(tripId));
  final segments = ref.watch(allSegmentProjectionProvider(tripId));

  final objects = [...userLocation, ...sketchElements, ...vertex, ...segments]
    ..sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));

  return ProjectedScene(objects);
}

@riverpod
MapScene tripEditorScene(Ref ref, TripId tripId) {
  final selection = ref.watch(
    editorModeProvider(tripId).select((m) => m.selection),
  );
  final projectScene = ref.watch(projectedTripEditorSceneProvider(tripId));
  return MapScene(selection: selection, projectedScene: projectScene);
}
