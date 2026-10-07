part of "../../../map_editor_mode.dart";

// idle_editor_mode.dart
mixin IdleBehavior on MapEditorMode {
  MapEditorMode withPopupPosition(ScreenOffset position);

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ || null => GestureResult.to(withPopupPosition(g.offset)),
    MapVertex e => GestureResult.to(VertexSelectMode(vertex: e)),
    MapSegment e => GestureResult.to(SegmentSelectMode(segment: e)),
    _ => GestureResult.none(),
  };
}

@freezed
final class IdleEditor extends MapEditorMode with IdleBehavior, _$IdleEditor {
  IdleEditor({this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  @override
  IdleEditor withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);
}
