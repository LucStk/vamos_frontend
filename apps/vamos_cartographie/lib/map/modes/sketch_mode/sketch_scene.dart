// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_end_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/layers/segments_layer.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/providers/sketch_layer.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';
import "package:vamos_cartographie/map/modes/modes.dart";

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([allSketchItem, allSegmentItem])
List<Layer> sketchScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  (ref, cam) => ref.watch(allSketchItemProvider(cam)),
  (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
];

@Dependencies([allSketchItem, allSegmentItem])
List<Layer> sketchGeneratingScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  (ref, cam) => ref.watch(allSketchItemProvider(cam)),
  (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
];
