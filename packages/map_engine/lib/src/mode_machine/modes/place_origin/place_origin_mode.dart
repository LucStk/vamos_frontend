import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/place_origin_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/modes/explore/explore_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/origin_menu.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

sealed class OriginTarget {
  const OriginTarget();

  MapObjectMenu<MapTripOrigin> get menu;
}

final class NewTrip extends OriginTarget {
  const NewTrip();
  @override
  MapObjectMenu<MapTripOrigin> get menu => SetOriginMenu();
}

final class ExistingTrip extends OriginTarget {
  const ExistingTrip(this.tripId);
  final TripId tripId;
  @override
  MapObjectMenu<MapTripOrigin> get menu => TripOriginMenu(tripId);
}

final class PlaceOriginMode extends AppMode {
  const PlaceOriginMode(this.target);
  final OriginTarget target;

  @override
  Set<Slot> get retainedSlots => {tripOriginSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTripOrigin _ => Transition.overlay<AppMode>(target.menu),
    _ => switch (target) {
      NewTrip _ => Transition.overlay<AppMode>(
        target.menu,
      ).and(tripOriginSlot, TripOrigin(g.world)),
      ExistingTrip _ => Transition.stay(),
    },
  };

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) {
    return switch (target) {
      NewTrip _ => Transition.overlay(target.menu),
      ExistingTrip t => Transition.run(
        SetTripOrigin(position: g.world, tripId: t.tripId),
        then: (_, _) => Transition.overlay(target.menu),
      ),
    };
  }

  // --- Intents ---
  static Transition<AppMode> forNewTrip() =>
      Transition.to(const PlaceOriginMode(NewTrip()));

  static Transition<AppMode> forTrip(TripId id, WorldOffset from) =>
      Transition.to<AppMode>(
        PlaceOriginMode(ExistingTrip(id)),
      ).and(tripOriginSlot, TripOrigin(from));

  /// La seule vraie différence entre les deux cas.
  Transition<AppMode> validate(WorldOffset origin) => switch (target) {
    NewTrip() => Transition.run(
      CreateTrip(origin),
      then: (_, data) => data.fold(
        (Failure f) => Transition.stay(),
        (trip) => TripActiveMode.switchTo(trip.id),
      ),
    ),
    ExistingTrip() => Transition.stay(),
  };

  Transition<AppMode> cancel() => switch (target) {
    NewTrip() => ExploreMode.switchTo(),
    ExistingTrip(:final tripId) => TripActiveMode.switchTo(tripId),
  };
}
