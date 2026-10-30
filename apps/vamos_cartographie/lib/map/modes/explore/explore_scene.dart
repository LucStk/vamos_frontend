// scene_composition.dart
import 'package:vamos_cartographie/map/modes/explore/providers/trips_layer.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/layers/segments_layer.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/providers/sketch_layer.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([allSketchItem, allSegmentItem])
List<Layer> exploreScene() => [
  (ref, cam) => ref.watch(allTripItemProvider(cam)),
];
