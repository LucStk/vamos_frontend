part of "../../map_editor_mode.dart";

// idle_editor_mode.dart
mixin IdleBehavior on MapEditorMode {
  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapVertex e => GestureResult.set(selection, VertexSelection(e.id)),
    MapSegment e => GestureResult.set(selection, SegmentSelection(e.id)),
    null => GestureResult.set(selection, null),
    _ => GestureResult.none(),
  };
  @override
  GestureResult<MapEditorMode> onLongPress(LongPressGesture g) =>
      switch (g.element) {
        _ => GestureResult.decorate(IdleMenu(g.offset)),
      };
  @override
  GestureResult<MapEditorMode> onSecondaryTap(SecondaryTapGesture g) =>
      switch (g.element) {
        _ => GestureResult.decorate(IdleMenu(g.offset)),
      };
}

@freezed
final class IdleEditor extends MapEditorMode with IdleBehavior, _$IdleEditor {
  IdleEditor();
}
