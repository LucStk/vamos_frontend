import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/trip_ready_mode.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/commands/waypoint_command.dart';

final class WaypointsEditMode extends TripMode {
  const WaypointsEditMode(super.tripId);
  @override
  Transition onTap(TapGesture g) {
    if (g.element is MapWaypoint) {
      return Transition.set(selectionSlot, g.element);
    }
    return Transition.stay();
  }

  @override
  Transition get back => Transition.to(TripReadyMode(tripId, readOnly: false));

  @override
  Transition onDragging(DragUpdateGesture g) => switch ((
    g.source.object,
    g.detail,
  )) {
    (MapWaypoint(:final id), _) => Transition.run(
      PatchWaypointPosition(
        position: g.target?.point ?? g.position.world,
        tripId: tripId,
        waypointId: id,
      ),
    ),
    (MapWaypointAnchor(:final waypointId), RouteDragDetail(:final position)) =>
      Transition.run(
        PatchWaypointAnchorPosition(
          tripId: tripId,
          waypointId: waypointId,
          position: position,
        ),
      ),
    _ => Transition.stay(),
  };
  @override
  Transition onDragEnd(DragEndGesture g) => switch (g.source.object) {
    MapWaypoint(:final id) => Transition.run(
      CommitWaypoint(tripId: tripId, waypointId: id),
    ),
    MapWaypointAnchor(:final waypointId) => Transition.run(
      CommitWaypoint(tripId: tripId, waypointId: waypointId),
    ),
    _ => Transition.stay(),
  };
}
