part of "../../map_editor_mode.dart";

// idle_editor_mode.dart
mixin IdleBehavior on MapEditorMode {
  @override
  Set<Slot> get retainedSlots => const {selectionSlot};
  @override
  Transition<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapVertex e => Transition.set(selectionSlot, VertexSelection(e.id)),
    MapSegment e => Transition.set(selectionSlot, SegmentSelection(e.id)),
    null => Transition.set(selectionSlot, null),
    _ => Transition.none(),
  };
  @override
  Transition<MapEditorMode> onLongPress(LongPressGesture g) =>
      switch (g.element) {
        _ => Transition.decorate(IdleMenu(g.offset)),
      };
  @override
  Transition<MapEditorMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => Transition.decorate(IdleMenu(g.offset)),
      };
}

final class IdleEditor extends MapEditorMode with IdleBehavior {
  IdleEditor();
}
