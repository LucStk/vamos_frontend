// scene_composition.dart
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/scene/items/waypoint/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/layers/localization_layer.dart';
import 'package:vamos_cartographie/map/scene/layers/segments/segments_layer.dart';
import 'package:vamos_cartographie/map/scene/layers/sketch/sketch_layer.dart';
import 'package:vamos_cartographie/map/scene/layers/trips/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/scene/layers/trips/trips_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

/// Couches toujours présentes, quel que soit le mode.
// scene_composition.dart
//
@Dependencies([localizationItem])
final baseLayers = <Layer>[
  (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
];

/// Seul endroit qui relie un mode à ses couches.
/// Seul endroit qui relie un mode à ses couches.
typedef Layer = List<SceneItem> Function(Ref ref, MapCameraController cam);

@Dependencies([allSketchItem, allSegmentItem, tripOriginItem])
List<Layer> layersFor(AppMode mode) => switch (mode) {
  ExploreMode() => [(ref, cam) => ref.watch(allTripItemProvider(cam))],
  SketchMode() => [(ref, cam) => ref.watch(allSketchItemProvider(cam))],
  SetTripOriginMode() => [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(cam))],
  ],
  TripMode(:final tripId) => [
    (ref, cam) => ref.watch(allWaypointItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
};
