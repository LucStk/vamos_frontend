part of "/src/modes/trip_editor/map_editor_command.dart";

sealed class IdleEditorCommand<R extends Object> extends EditorCommand<R> {
  const IdleEditorCommand();
}

final class CreateSimpleVertex extends IdleEditorCommand<Done> {
  const CreateSimpleVertex(this.position);
  final LatLng position;
}

final class CreateWaypointFromPosition extends IdleEditorCommand<Done> {
  const CreateWaypointFromPosition(this.position);
  final LatLng position;
}

mixin IdleEditorResolver {
  GraphEditor get graphEditor;
  WaypointEditor get waypointEditor;

  Future<Object?> resolveIdle(IdleEditorCommand command) => switch (command) {
    CreateSimpleVertex(:final position) => done(
      () => graphEditor.createSimpleVertex(position),
    ),
    CreateWaypointFromPosition(:final position) => done(
      () => waypointEditor.createBlankWaypointFromPosition(position),
    ),
  };
}
