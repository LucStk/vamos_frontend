import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';

final class WaypointsEditMode extends TripMode {
  const WaypointsEditMode(super.tripId);
  @override
  Transition onTap(TapGesture g) {
    if (g.element is MapWaypoint) {
      return Transition.set(selectionSlot, g.element);
    }
    return Transition.stay();
  }
}
