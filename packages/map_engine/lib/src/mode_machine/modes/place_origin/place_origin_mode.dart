import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/place_origin_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/explore/explore_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/context_menu.dart';
import 'package:map_engine/src/mode_machine/overlay/origin_menu.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

sealed class PlaceOriginMode extends AppMode {
  const PlaceOriginMode();

  @override
  Set<Slot> get retainedSlots => {tripOriginSlot};

  // --- Ce qui diffère selon le cas ---
  MapObjectMenu get menu;

  /// Tap hors de l'origine : rien par défaut.
  Transition<AppMode> onTapElsewhere(TapGesture g) => Transition.stay();

  // --- Commun ---
  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTripOrigin _ => Transition.overlay<AppMode>(menu),
    _ => onTapElsewhere(g),
  };

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  // --- Intents ---
  static Transition<AppMode> forNewTrip() =>
      Transition.to<AppMode>(const PlaceNewTripOrigin());

  static Transition<AppMode> forTrip(TripId id, WorldOffset from) =>
      Transition.to<AppMode>(
        PlaceExistingTripOrigin(id),
      ).and(tripOriginSlot, TripOrigin(from));
}

final class PlaceNewTripOrigin extends PlaceOriginMode {
  const PlaceNewTripOrigin();

  @override
  MapObjectMenu<MapTmpOrigin> get menu => SetOriginMenu();

  /// Un tap sur la carte pose l'origine et ouvre le menu.
  @override
  Transition<AppMode> onTapElsewhere(TapGesture g) =>
      Transition.overlay<AppMode>(
        menu,
      ).and(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) => Transition.overlay(menu);

  Transition<AppMode> validate(WorldOffset origin) => Transition.run(
    CreateTrip(origin),
    then: (_, data) => data.fold(
      (Failure f) => Transition.stay(),
      (trip) => TripMode.open(trip.id),
    ),
  );

  Transition<AppMode> cancel() => Transition.to(ExploreMode());
}

final class PlaceExistingTripOrigin extends PlaceOriginMode {
  const PlaceExistingTripOrigin(this.tripId);
  final TripId tripId;

  @override
  MapObjectMenu<MapTripOrigin> get menu => TripOriginMenu(tripId);

  /// Le déplacement est enregistré à la fin du drag, puis le menu s'ouvre.
  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) => Transition.run(
    SetTripOrigin(position: g.world, tripId: tripId),
    then: (_, _) => Transition.overlay(menu),
  );

  @override
  bool operator ==(Object other) =>
      other is PlaceExistingTripOrigin && other.tripId == tripId;
  @override
  int get hashCode => Object.hash(runtimeType, tripId);
}
