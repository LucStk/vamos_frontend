import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/providers/span_bound_handle_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segment_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

/// Scène de [EditSpanMode]. L'UI est commune à la famille (`tripEditView`).
///
/// Ordre « dessus d'abord » : la première couche est dessinée en dernier.
/// À `hitPriority` égale, c'est cet ordre qui décide qui passe au-dessus.
SceneSpec editSpanScene(EditSpanMode m) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(m.tripId, cam))],
    (ref, cam) => [?ref.watch(tripEndItemProvider(m.tripId, cam))],
    // Édition (surlignage + curseurs) au-dessus du contenu de la route,
    // y compris du segment sélectionné.
    (ref, cam) => ref.watch(spanBoundHandleItemsProvider(m, cam)),
    (ref, cam) => ref.watch(allMobilityBadgeItemProvider(m.tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(m.tripId, cam)),
  ],
  traits: [
    // Le segment est dessiné par la couche des segments ; on ne fait ici que
    // le désigner comme sélectionné.
    traitOn(
      VisualTrait.selected,
      (ref, cam) => [
        ?ref.watch(segmentItemProvider(m.tripId, m.mobilitySpanId, cam)),
      ],
    ),
  ],
);