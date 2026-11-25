import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/trip/trip_route_items.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/waypoints_edit.dart';
import 'package:vamos_cartographie/map/objects/route/day_segment/drag_proxy_item.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_preview_item.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec selectRouteScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    // Choisir une portion de route : les waypoints ne sont qu'un repère, au
    // second plan et presque transparents.
    (ref, cam) => backgroundWaypointItems(ref, tripId, cam),
    (ref, cam) => ref.watch(selectionHandleItemsProvider(tripId, cam)),
    // La route par sections de mobilité, sans la séparation en jours.
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
    // Le glissement qui a ouvert la sélection part d'un jour de la route : il
    // reste dans la scène, invisible, pour que le doigt continue de suivre la
    // route.
    (ref, cam) => [
      for (final item in dayRouteItems(ref, tripId, cam)) DragProxyItem(item),
    ],
  ],
);

/// Route actuelle (dessous) et portion que produirait le re-routage (dessus) :
/// rien n'est encore écrit dans la route. Pendant le calcul, la route seule.
SceneSpec portionPreviewScene(PortionPreviewMode m) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripEndItemProvider(m.tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(m.tripId, cam))],
    (ref, cam) {
      final preview = m.preview;
      return preview == null ? const [] : sketchPreviewItems(preview, cam);
    },
    (ref, cam) => ref.watch(allSegmentItemProvider(m.tripId, cam)),
  ],
);
