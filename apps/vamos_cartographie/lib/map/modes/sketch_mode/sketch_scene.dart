// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/pencil/providers/pencil_item_provider.dart';
import 'package:vamos_cartographie/map/objects/segment/providers/segments_layer.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_trace.dart';
import 'package:vamos_cartographie/map/objects/trip_end/providers/trip_end_item_provider.dart';
import 'package:vamos_cartographie/map/objects/trip_origin/providers/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([pencilItem, sketchTraceItem, sketchOriginItem, sketchEndItem])
List<Layer> sketchScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(sketchOriginItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(sketchEndItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(pencilItemProvider(cam))],
  (ref, cam) => [?ref.watch(sketchTraceItemProvider(false, cam))],
  (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
];

@Dependencies([sketchTraceItem])
List<Layer> sketchGeneratingScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(sketchTraceItemProvider(true, cam))],
  (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
];
