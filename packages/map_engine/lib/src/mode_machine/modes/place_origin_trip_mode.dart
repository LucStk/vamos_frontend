part of "../app_mode.dart";

// mode just après avoir créé un trip pour poser le premier point
sealed class PlaceOriginTripMode extends AppMode {
  const PlaceOriginTripMode();

  @override
  Transition<AppMode> onTap(TapGesture g) => Transition.overlay(
    TripOriginMenu(),
  ).and(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragging(DragUpdateGesture g) =>
      Transition.set(tripOriginSlot, TripOrigin(g.world));

  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) =>
      Transition.overlay(TripOriginMenu());
}
