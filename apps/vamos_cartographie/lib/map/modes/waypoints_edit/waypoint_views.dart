import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/create_waypoint_ui.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/edit_waypoints_ui.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/providers/anchor_waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/providers/pending_waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec createWaypointScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => ref.watch(allWaypointItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(allWaypointAnchorItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(pendingWaypointProvider(tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);

ModeView createWaypointView(CreateWaypointMode m) => ModeView(
  scene: createWaypointScene(m.tripId),
  ui: () => WaypointsEditUi(m),
);

ModeView editWaypointsView(WaypointsEditMode m) => ModeView(
  scene: createWaypointScene(m.tripId),
  ui: () => WaypointsEditUi(m),
);
