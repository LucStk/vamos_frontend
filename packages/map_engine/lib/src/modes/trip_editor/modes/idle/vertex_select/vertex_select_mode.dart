part of "../../../map_editor_mode.dart";

// vertex_select_mode.dart
@freezed
final class VertexSelectMode extends MapEditorMode
    with IdleBehavior, _$VertexSelectMode {
  VertexSelectMode({required this.vertex});

  final MapVertex vertex;
}
