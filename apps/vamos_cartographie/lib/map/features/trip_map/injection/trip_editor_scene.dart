import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import '/domain_features/topology/injection/queries/segment_queries.dart';
import '/domain_features/topology/injection/queries/vertex_queries.dart';
import '/map/camera/injection/camera_or_null.dart';
import '/map/injection/localization_item.dart';
import '/map/injection/map_mode.dart';
import 'segment_item.dart';
import 'sketch_item.dart';
import 'vertex_item.dart';

part 'trip_editor_scene.g.dart';

@Riverpod(dependencies: [vertexItem])
List<PointItem> vertexItems(Ref ref, TripId tripId, MapCameraReader camera) {
  return [
    for (final id in ref.watch(allVertexIdsProvider(tripId)))
      ref.watch(vertexItemProvider(tripId, id, camera)),
  ];
}

@Riverpod(dependencies: [segmentItem])
List<LineItem> segmentItems(Ref ref, TripId tripId, MapCameraReader camera) {
  final segments = ref.watch(allSegmentsProvider(tripId));
  return [
    for (final segment in segments)
      ref.watch(segmentItemProvider(tripId, segment.id, camera)),
  ];
}

@Riverpod(
  dependencies: [
    sketchItem,
    vertexItems,
    segmentItems,
    CameraOrNull,
    localizationItem,
  ],
)
List<SceneItem> tripEditorSceneItems(Ref ref, TripId tripId) {
  final camera = ref.watch(cameraOrNullProvider);
  if (camera == null) return [];
  final userLocation = ref.watch(localizationItemProvider(camera));
  final sketchElements = ref.watch(sketchItemProvider(tripId, camera));
  final vertex = ref.watch(vertexItemsProvider(tripId, camera));
  final segments = ref.watch(segmentItemsProvider(tripId, camera));

  final objects = [?userLocation, ...sketchElements, ...vertex, ...segments]
    ..sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return objects;
}

@Riverpod(dependencies: [modeContext, tripEditorSceneItems])
MapScene tripEditorScene(Ref ref, TripId tripId) {
  final selected = ref.watch(
    modeContextProvider.select((c) => c.get(selectionSlot)),
  );

  final items = ref.watch(tripEditorSceneItemsProvider(tripId));

  return MapScene(selection: selected, items: items);
}
