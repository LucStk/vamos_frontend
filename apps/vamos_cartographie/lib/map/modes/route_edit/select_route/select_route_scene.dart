// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([selectionHandleItems])
List<Layer> selectRouteScene(TripId tripId) => [
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
  (ref, cam) => ref.watch(selectionHandleItemsProvider(tripId, cam)),
  (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
];
