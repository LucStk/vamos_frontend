// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/pencil/providers/pencil_item_provider.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_trace.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec sketchScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(sketchOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(sketchEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(pencilItemProvider(cam))],
    (ref, cam) => [?ref.watch(sketchTraceItemProvider(false, cam))],
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);

SceneSpec sketchGeneratingScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(sketchTraceItemProvider(true, cam))],
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);
