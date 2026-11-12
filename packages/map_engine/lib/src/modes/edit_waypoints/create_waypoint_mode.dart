import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/edit_waypoints/commands/waypoint_command.dart';
import 'package:map_engine/src/modes/edit_waypoints/edit_waypoints.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

final class CreateWaypointMode extends TripMode {
  const CreateWaypointMode(super.tripId);
  @override
  Transition onTap(TapGesture g) => Transition.set(
    pendingWaypointSlot,
    PendingWaypoint(hit: g.hit ?? HitGeo(g.world)),
  );
  @override
  Transition onDragging(DragUpdateGesture g) => Transition.set(
    pendingWaypointSlot,
    PendingWaypoint(hit: g.target ?? HitGeo(g.world)),
  );

  Transition validatePosition() => Transition.withSlot(
    pendingWaypointSlot,
    (s) => Transition.run(
      CreateWaypoint(tripId: tripId, position: s.point),
      then: (_, _) => Transition.to(WaypointsEditMode(tripId)),
    ),
  );
}
