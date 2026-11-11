import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/providers/waypoints_edit_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec waypointsEditScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => ref.watch(allWaypointItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(pendingWaypointProvider(tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);
