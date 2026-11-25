import 'package:riverpod/riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/waypoints_edit.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/search_result_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

/// Le curseur posé sur le départ ou l'arrivée de la route prend sa place :
/// l'extrémité est masquée tant qu'il la recouvre.
bool cursorCovers<T extends MapObject>(Ref ref) => ref.watch(
  modeSlotProvider(
    searchResultMarkerSlot,
  ).select((c) => c?.anchor?.object is T),
);

/// La scène de l'édition du trip sans outil actif ([TripEditMode]) : la
/// route, ses étapes et leurs ancres, le curseur et la position de
/// l'utilisateur.
SceneSpec tripEditScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
    (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
    (ref, cam) => [
      if (!cursorCovers<MapTripEnd>(ref))
        ?ref.watch(tripEndItemProvider(tripId, cam)),
    ],
    (ref, cam) => [
      if (!cursorCovers<MapTripStart>(ref))
        ?ref.watch(tripOriginItemProvider(tripId, cam)),
    ],
    (ref, cam) => ref.watch(allWaypointItemProvider(tripId, cam)),
    (ref, cam) => visibleWaypointAnchors(ref, tripId, cam),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);
