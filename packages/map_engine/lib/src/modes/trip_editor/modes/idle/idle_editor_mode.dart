part of "../../map_editor_mode.dart";

@freezed
final class IdleEditor extends MapEditorMode with _$IdleEditor {
  IdleEditor({this.popUpPosition});

  @override
  final PopUpPositionType popUpPosition;

  IdleEditor withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) => switch (g.element) {
    MapUserLocation _ => () {
      return GestureResult(mode: withPopupPosition(g.offset));
    }(),
    MapVertex e => GestureResult(mode: VertexSelectMode(vertex: e)),
    MapSegment e => GestureResult(mode: SegmentSelectMode(segment: e)),
    null => GestureResult(mode: withPopupPosition(g.offset)),
    _ => GestureResult.none(),
  };
}
