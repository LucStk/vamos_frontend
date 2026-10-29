// scene_composition.dart
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/modes/explore/providers/trips_layer.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_end_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/layers/segments_layer.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/providers/sketch_layer.dart';
import 'package:vamos_cartographie/map/scene/layers/localization_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

/// Couches toujours présentes, quel que soit le mode.
final baseLayers = <Layer>[
  (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
];

/// Seul endroit qui relie un mode à ses couches.
typedef Layer = List<SceneItem> Function(Ref ref, MapCameraController cam);

@Dependencies([allSketchItem, allSegmentItem])
List<Layer> layersFor(AppMode mode) => switch (mode) {
  ExploreMode() => [(ref, cam) => ref.watch(allTripItemProvider(cam))],
  SketchEdition(:final tripId) => [
    (ref, cam) => ref.watch(allSketchItemProvider(cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
  // Doit précéder TripMode : SketchGenerating en hérite.
  SketchGenerating(:final tripId) => [
    (ref, cam) => ref.watch(allSketchItemProvider(cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
  PlaceExistingTripOrigin(:final tripId) => [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  ],
  PlaceNewTripOrigin() => [
    (ref, cam) => [?ref.watch(tmpOriginItemProvider(cam))],
  ],
  TripMode(:final tripId) => [
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => ref.watch(allWaypointItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
  _ => [],
};
