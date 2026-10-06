part of "../../map_editor_mode.dart";

@freezed
final class VertexSelectMode extends IdleEditor with _$VertexSelectMode {
  VertexSelectMode({required this.vertex});
  final MapVertex vertex;
}

extension VertexSelectIntents on VertexSelectMode {
  GestureResult<MapEditorMode> deleteVertex() =>
      GestureResult.run(RemoveVertex(vertex.id));

  GestureResult<MapEditorMode> sketchCreation(LatLng position) =>
      GestureResult.to(
        SketchCreation(
          vertexStart: vertex.id,
          path: [position],
          mobilityType: MobilityType.bike,
        ),
      );
}

final class VertexRemoved extends EditorModeCommandPayload {
  const VertexRemoved(this.vertexId);
  final VertexId vertexId;
}
