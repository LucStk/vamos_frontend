// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

List<Layer> placeExistingTripOriginScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
];
@Dependencies([tmpOriginItem])
List<Layer> placeNewTripOriginScene() => [
  (ref, cam) => [?ref.watch(tmpOriginItemProvider(cam))],
];
