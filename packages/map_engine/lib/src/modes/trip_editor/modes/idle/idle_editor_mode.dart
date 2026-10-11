part of "../../map_editor_mode.dart";

// idle_editor_mode.dart
mixin IdleBehavior on MapEditorMode {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  Transition<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapVertex e => Transition.set(selectionSlot, e),
    MapSegment e => Transition.set(selectionSlot, e),
    null => Transition.set(selectionSlot, null),
    _ => Transition.stay(),
  };
  @override
  Transition<MapEditorMode> onLongPress(LongPressGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(IdleMenu(g.screen)),
      };
  @override
  Transition<MapEditorMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.overlay(IdleMenu(g.screen)),
      };
}

final class IdleEditor extends MapEditorMode with IdleBehavior {
  IdleEditor();
}
