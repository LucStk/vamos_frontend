part of "/src/modes/trip_editor/map_editor_command.dart";

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

mixin WaypointReader {
  WaypointEditor get waypointEditor;
}

mixin VertexSelectResolver {
  GraphEditor get graphEditor;
  WaypointEditor get waypointEditor;
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
