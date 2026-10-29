import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_machine/command/place_origin_command.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/explore/explore_mode.dart';
import 'package:map_engine/src/mode_machine/modes/shared/trip_mode.dart';
import 'package:map_engine/src/mode_machine/overlay/overlay.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/slots/trip_origin_slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';
import 'package:trip_application/trip_application.dart';

sealed class PlaceOriginMode extends AppMode {
  const PlaceOriginMode();

  @override
  Set<Slot> get retainedSlots => {tripOriginSlot};

  Transition<AppMode> onTapElsewhere(TapGesture g) => Transition.stay();

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTripOrigin _ => Transition.overlay<AppMode>(g.tapMenu),
    _ => onTapElsewhere(g),
  };
}

final class PlaceNewTripOrigin extends PlaceOriginMode {
  const PlaceNewTripOrigin();

  /// Un tap sur la carte pose l'origine et ouvre le menu.
  @override
  Transition<AppMode> onTapElsewhere(TapGesture g) =>
      Transition.overlay<AppMode>(
        TapMenu(g.world, object: null),
      ).and(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

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
  Transition<AppMode> onTap(TapGesture g) {
    print("gesture ${g.element}");
    return switch (g.element) {
      MapTripOrigin _ => Transition.overlay(g.tapMenu),
      _ => onTapElsewhere(g),
    };
  }

  /// Le déplacement est enregistré à la fin du drag, puis le menu s'ouvre.
  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) => Transition.run(
    SetTripOrigin(position: g.world, tripId: tripId),
    then: (_, _) => Transition.overlay(g.dragEndMenu),
  );
  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.run(PatchTripOrigin(position: g.world, tripId: tripId));

  @override
  bool operator ==(Object other) =>
      other is PlaceExistingTripOrigin && other.tripId == tripId;
  @override
  int get hashCode => Object.hash(runtimeType, tripId);
}
