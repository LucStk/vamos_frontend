part of "../app_mode.dart";

sealed class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
}

final class TripEditMode extends TripViewMode {
  const TripEditMode(super.tripId);
}

final class TripViewMode extends TripMode {
  const TripViewMode(super.tripId);

  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapVertex e => Transition.set(selectionSlot, e),
    MapSegment e => Transition.set(selectionSlot, e),

    // Tap dans le vide : d'abord on désélectionne, ensuite seulement on sort.
    null => Transition.withState<AppMode>(
      (st) => st.slots.get(selectionSlot) == null
          ? Transition.run<AppMode, Done>(
              CameraBack(),
              then: (_, _) => Transition.to<AppMode>(const ExploreMode()),
            )
          : Transition.set(selectionSlot, null),
    ),

    _ => Transition.stay(),
  };
  @override
  Transition<AppMode> onLongPress(LongPressGesture g) => switch (g.element) {
    _ => Transition.overlay(IdleMenu(g.screen)),
  };
  @override
  Transition<AppMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(IdleMenu(g.screen)),
      };
}
