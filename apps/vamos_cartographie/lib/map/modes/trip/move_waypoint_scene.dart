import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/waypoints_edit.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

/// Déplacement d'une étape : elle (au premier plan) et son ancre se
/// manipulent ; les autres étapes ne sont qu'un repère, au second plan et
/// presque transparentes ; les marqueurs de mobilité disparaissent.
SceneSpec moveWaypointScene(MoveWaypointMode m) => SceneSpec(
  layers: [
    (ref, cam) => [
      ref.watch(waypointItemProvider(m.tripId, m.waypointId, cam)),
    ],
    (ref, cam) =>
        ref.watch(anchorWaypointItemProvider(m.tripId, m.waypointId, cam)),
    (ref, cam) => [?ref.watch(tripEndItemProvider(m.tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(m.tripId, cam))],
    (ref, cam) => backgroundWaypointItems(
      ref,
      m.tripId,
      cam,
      except: m.waypointId,
    ),
    (ref, cam) => ref.watch(allSegmentItemProvider(m.tripId, cam)),
  ],
);
