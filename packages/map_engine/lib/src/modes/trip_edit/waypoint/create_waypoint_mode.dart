import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip_edit/trip_edit_mode.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/commands/waypoint_command.dart';
import 'package:map_engine/src/modes/trip_edit/waypoint/slots/pending_waypoint.dart';

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
      // Retour à l'édition du trip (c'est elle qui a une vue), l'étape créée
      // sélectionnée.
      then: (_, id) => Transition.to(TripEditMode(tripId)).and<MapObject>(
        selectionSlot,
        MapWaypoint(id: id, tripId: tripId),
      ),
    ),
  );
}
