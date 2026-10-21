part of '../app_mode.dart';

class ExploreMode extends AppMode {
  const ExploreMode();

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapTrip e => Transition.run<AppMode, Done>(
      FocusTrip(e.id),
      then: (_, _) => Transition.to<AppMode>(
        e.isOwned ? TripActiveMode(e.id) : TripReadOnlyMode(e.id),
      ),
    ),
    _ => Transition.stay(),
  };

  static Transition<AppMode> selectTrip(MapTrip trip) =>
      Transition.set(selectionSlot, trip);
}
