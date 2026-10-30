// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/place_origin/providers/tmp_origin_item_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/providers/items/trip_origin_item_provider.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([])
List<Layer> placeExistingTripOriginScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
];
@Dependencies([])
List<Layer> placeNewTripOriginScene() => [
  (ref, cam) => [?ref.watch(tmpOriginItemProvider(cam))],
];
