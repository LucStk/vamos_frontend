part of "../../../map_editor_mode.dart";

sealed class VertexSelectCommand<R extends Object> extends EditorCommand<R> {
  const VertexSelectCommand();
}

final class RemoveVertex extends VertexSelectCommand<Done> {
  const RemoveVertex(this.vertexId);
  final VertexId vertexId;
}

final class CreateWaypointFromVertex extends VertexSelectCommand<Done> {
  const CreateWaypointFromVertex(this.vertexId);
  final VertexId vertexId;
}

final class MoveVertex extends VertexSelectCommand<Done> {
  const MoveVertex(this.vertexId, this.position);
  final VertexId vertexId;
  final LatLng position;
}

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

mixin WaypointReader {
  WaypointEditor get waypointEditor;
}

mixin VertexSelectResolver on GraphReader, WaypointReader {
  Future<Object?> resolveVertexSelect(VertexSelectCommand command) =>
      switch (command) {
        RemoveVertex(:final vertexId) => done(
          () => graphEditor.removeVertex(vertexId),
        ),
        CreateWaypointFromVertex(:final vertexId) => done(
          () => waypointEditor.createBlankWaypointFromVertex(vertexId),
        ),
        MoveVertex(:final vertexId, :final position) => done(
          () => graphEditor.moveVertex(vertexId, position),
        ),
      };
}
