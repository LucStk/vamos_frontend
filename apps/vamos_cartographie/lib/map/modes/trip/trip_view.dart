// map/modes/route_edit/sketch/sketch_view.dart
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/trip/dim_outside_day.dart';
import 'package:vamos_cartographie/map/modes/trip/trip_route_items.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/waypoint_scene.dart'
    show cursorCovers;
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ui.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/search_result_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';

ModeView tripReadyView(TripReadyMode m) => ModeView(
  scene: SceneSpec(
    layers: [
      // Le curseur (résultat de recherche, position de l'utilisateur ou point
      // touché) est au-dessus de tout.
      (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
      (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
      // Un curseur posé sur le départ ou l'arrivée prend sa place.
      (ref, cam) => [
        if (!cursorCovers<MapTripEnd>(ref))
          ?ref.watch(tripEndItemProvider(m.tripId, cam)),
      ],
      (ref, cam) => [
        if (!cursorCovers<MapTripStart>(ref))
          ?ref.watch(tripOriginItemProvider(m.tripId, cam)),
      ],
      (ref, cam) => ref.watch(allMobilityBadgeItemProvider(m.tripId, cam)),
      (ref, cam) => ref.watch(allWaypointItemProvider(m.tripId, cam)),
      (ref, cam) => tripRouteItems(ref, m.tripId, cam),
    ],
    // Un jour sélectionné : le reste de la route s'efface.
    traits: [(ref, cam) => dimOutsideSelectedDay(ref, m.tripId, cam)],
  ),
  ui: () => TripReadyUi(m),
);
