part of '../app_mode.dart';

class ExploreMode extends AppMode {
  const ExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    // MapTrip e => Transition.run(FocusTrip(e)).and(selectionSlot, e),
    _ => Transition.stay(),
  };

  static Transition<AppMode> selectTrip(TripId tripId) =>
      Transition.set(selectionSlot, MapTrip(tripId));
}
