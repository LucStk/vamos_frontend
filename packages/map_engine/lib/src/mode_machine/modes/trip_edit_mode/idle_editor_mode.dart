part of "../trip_edit_mode.dart";

// idle_editor_mode.dart
mixin IdleBehavior on TripEditMode {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  Transition<TripEditMode> onTap(TapGesture g) => switch (g.element) {
    MapVertex e => Transition.set(selectionSlot, e),
    MapSegment e => Transition.set(selectionSlot, e),
    null => Transition.set(selectionSlot, null),
    _ => Transition.stay(),
  };
  @override
  Transition<TripEditMode> onLongPress(LongPressGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(IdleMenu(g.screen)),
      };
  @override
  Transition<TripEditMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(IdleMenu(g.screen)),
      };
}

final class IdleEditor extends TripEditMode with IdleBehavior {
  IdleEditor();
}
