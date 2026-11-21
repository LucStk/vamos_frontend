import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/explore/explore_mode.dart';
import 'package:map_engine/src/modes/shared/slots/selection_slot.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:map_engine/src/modes/trip/commands/edit_trip_command.dart';

final class TripReadyMode extends TripMode {
  const TripReadyMode(super.tripId, {this.readOnly = true});
  final bool readOnly;

  @override
  Transition get back => Transition.to(ExploreMode());

  @override
  Transition onTap(TapGesture g) {
    final e = g.element;

    if (e is MapObject && (e is MapWaypoint || e is MapMobilitySpan)) {
      return Transition.withState((st) {
        final current = st.slots.get(selectionSlot);
        // même élément => on désélectionne, sinon on sélectionne le nouveau
        return Transition.set<MapObject>(
          selectionSlot,
          current == e ? null : e,
        );
      });
    }

    // tap dans le vide ou sur un élément non sélectionnable => désélection
    return Transition.set<MapObject>(selectionSlot, null);
  }

  Transition deleteTripRoute() => Transition.run(
    DeleteRoute(tripId: tripId),
    then: (_, data) =>
        data.fold((l) => Transition.stay(), (_) => TripMode.open(tripId)),
  );
}
