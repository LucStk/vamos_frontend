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

mixin IdleEditorResolver on GraphReader, WaypointReader {
  Future<Object?> resolveIdle(IdleEditorCommand command) => switch (command) {
    CreateSimpleVertex(:final position) => _done(
      () => graphEditor.createSimpleVertex(position),
    ),
    CreateWaypointFromPosition(:final position) => _done(
      () => waypointEditor.createBlankWaypointFromPosition(position),
    ),
  };
}
