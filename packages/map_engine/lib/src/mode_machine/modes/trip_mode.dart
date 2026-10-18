part of "../app_mode.dart";

sealed class TripMode extends AppMode {
  const TripMode(this.tripId);
  final TripId tripId;
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};

  @override
  Transition<AppMode> onTap(TapGesture g) => switch (g.element) {
    MapVertex e => Transition.overlay(VertexMenu(e)).and(selectionSlot, e),
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
}

final class TripViewMode extends TripMode {
  const TripViewMode(super.tripId);
}
