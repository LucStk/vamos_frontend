// scene_composition.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([selectionHandleItems])
List<Layer> selectSpanScene(TripId tripId, MobilitySpanId spanId) => [
  (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
  (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
  (ref, cam) => [
    for (final s in ref.watch(mobilitySpansProvider(tripId)))
      if (s.id != spanId) ?ref.watch(segmentItemProvider(tripId, s.id, cam)),
  ],
  (ref, cam) => [?ref.watch(segmentItemProvider(tripId, spanId, cam))],

  (ref, cam) => ref.watch(selectionHandleItemsProvider(tripId, cam)),
];
