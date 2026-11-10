// scene_composition.dart
import 'package:map_canvas/map_canvas.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

@Dependencies([selectionHandleItems])
SceneSpec selectSpanScene(TripId tripId, MobilitySpanId spanId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => ref.watch(selectionHandleItemsProvider(tripId, cam)),
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
