part of "../app_mode.dart";

// mode just après avoir créé un trip pour poser le premier point
final class CreateTripMode extends AppMode {
  const CreateTripMode();

  @override
  Transition<AppMode> onTap(TapGesture g) => Transition.overlay(
    TripOriginMenu(MapTripOrigin()),
  ).and(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) =>
      Transition.overlay(TripOriginMenu(MapTripOrigin()));

  static Transition<AppMode> switchTo() => Transition.to(CreateTripMode());

  Transition<AppMode> validateOrigin() {
    return Transition.withSlot(
      tripOriginSlot,
      (slot) => Transition.run(
        CreateTrip(slot.point),
        then: (mode, res) => res.fold(
          (Failure f) => throw f,
          (trip) => Transition.to(TripActiveMode(trip.id)),
        ),
      ),
    );
  }
}
