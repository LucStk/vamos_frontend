import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/providers/anchor_waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/providers/pending_waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/objects/waypoint/providers/waypoint_item_provider.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

@Dependencies([pendingWaypoint])
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
