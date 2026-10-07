part of "../../../map_editor_mode.dart";

// vertex_select_mode.dart
@freezed
final class VertexSelectMode extends MapEditorMode
    with IdleBehavior, _$VertexSelectMode {
  VertexSelectMode({required this.vertex, this.popUpPosition});

  final MapVertex vertex;

  @override
  final PopUpPositionType popUpPosition;

  @override
  VertexSelectMode withPopupPosition(ScreenOffset position) =>
      copyWith(popUpPosition: position);
}
