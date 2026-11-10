// scene_composition.dart
import 'package:map_canvas/map_canvas.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/route_edit/edit_span/providers/span_bound_handle_provider.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

@Dependencies([spanBoundHandleItems])
SceneSpec editSpanScene(TripId tripId, MobilitySpanId spanId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => ref.watch(spanBoundHandleItemsProvider(tripId, spanId, cam)),
    (ref, cam) => ref.watch(allMobilityBadgeItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
  traits: [
    // Le segment est dessiné par la couche des segments ; on ne fait ici que
    // le désigner comme sélectionné.
    traitOn(
      VisualTrait.selected,
      (ref, cam) => [?ref.watch(segmentItemProvider(tripId, spanId, cam))],
    ),
  ],
);
