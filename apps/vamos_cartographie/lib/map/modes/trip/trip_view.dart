// map/modes/route_edit/sketch/sketch_view.dart
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/trip/dim_outside_day.dart';
import 'package:vamos_cartographie/map/modes/trip/trip_route_items.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ui.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';

ModeView tripReadyView(TripReadyMode m) => ModeView(
  scene: SceneSpec(
    layers: [
      (ref, cam) => [?ref.watch(tripEndItemProvider(m.tripId, cam))],
      (ref, cam) => [?ref.watch(tripOriginItemProvider(m.tripId, cam))],
      (ref, cam) => ref.watch(allMobilityBadgeItemProvider(m.tripId, cam)),
      (ref, cam) => ref.watch(allWaypointItemProvider(m.tripId, cam)),
      (ref, cam) => tripRouteItems(ref, m.tripId, cam),
    ],
    // Un jour sélectionné : le reste de la route s'efface.
    traits: [(ref, cam) => dimOutsideSelectedDay(ref, m.tripId, cam)],
  ),
  ui: () => TripReadyUi(m),
);
