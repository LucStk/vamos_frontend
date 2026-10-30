// scene_composition.dart
import 'package:vamos_cartographie/map/modes/explore/providers/trips_layer.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([])
List<Layer> exploreScene() => [
  (ref, cam) => ref.watch(allTripItemProvider(cam)),
];
