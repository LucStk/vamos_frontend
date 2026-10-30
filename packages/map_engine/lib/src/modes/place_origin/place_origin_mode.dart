import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/app_mode.dart';
import 'package:map_engine/src/modes/explore/explore_mode.dart';
import 'package:map_engine/src/modes/place_origin/commands/place_origin_command.dart';
import 'package:map_engine/src/modes/place_origin/slots/trip_origin_slot.dart';
import 'package:map_engine/src/modes/shared/overlays/context_menu.dart';
import 'package:map_engine/src/modes/shared/trip_mode.dart';
import 'package:trip_application/trip_application.dart';

sealed class PlaceOriginMode extends AppMode {
  const PlaceOriginMode();

  @override
  Set<Slot> get retainedSlots => {tripOriginSlot};

  Transition onTapElsewhere(TapGesture g) => Transition.stay();

  @override
  Transition onTap(TapGesture g) => switch (g.element) {
    MapTripOrigin _ => Transition.overlay(g.tapMenu),
    _ => onTapElsewhere(g),
  };
}

final class PlaceNewTripOrigin extends PlaceOriginMode {
  const PlaceNewTripOrigin();

  /// Un tap sur la carte pose l'origine et ouvre le menu.
  @override
  Transition onTapElsewhere(TapGesture g) => Transition.overlay(
    TapMenu(g.world, object: null),
  ).and(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  Transition validate(WorldOffset origin) => Transition.run(
    CreateTrip(origin),
    then: (_, data) => data.fold(
      (Failure f) => Transition.stay(),
      (trip) => TripMode.open(trip.id),
    ),
  );

  Transition cancel() => Transition.to(ExploreMode());
}

final class PlaceExistingTripOrigin extends PlaceOriginMode {
  const PlaceExistingTripOrigin(this.tripId);
  final TripId tripId;

  @override
  Transition onTap(TapGesture g) {
    print("gesture ${g.element}");
    return switch (g.element) {
      MapTripOrigin _ => Transition.overlay(g.tapMenu),
      _ => onTapElsewhere(g),
    };
  }

  /// Le déplacement est enregistré à la fin du drag, puis le menu s'ouvre.
  @override
  Transition onDragEnd(DragEndGesture g) => Transition.run(
    SetTripOrigin(position: g.world, tripId: tripId),
    then: (_, _) => Transition.overlay(g.dragEndMenu),
  );
  @override
  Transition onDragging(DragUpdateGesture g) =>
      Transition.run(PatchTripOrigin(position: g.world, tripId: tripId));

  @override
  bool operator ==(Object other) =>
      other is PlaceExistingTripOrigin && other.tripId == tripId;
  @override
  int get hashCode => Object.hash(runtimeType, tripId);
}
