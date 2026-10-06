part of "../../map_editor_mode.dart";

@freezed
abstract class SketchEdition extends MapEditorMode
    with SketchMode, _$SketchEdition {
  SketchEdition._();

  factory SketchEdition({
    required SegmentId segmentId,
    required List<LatLng> path,
    VertexId? touchedVertex,
    MapObject? selection,
    PopUpPositionType popUpPosition,
  }) = _SketchEdition;
  @override
  SketchEdition withSelection(MapObject? selection) =>
      copyWith(selection: selection);
  @override
  SketchEdition withPath(List<LatLng> path) => copyWith(path: path);

  @override
  GestureResult<MapEditorMode> onPointerDown(
    PointerDownGesture g,
    ScreenOffset p,
  ) => switch (g.element) {
    MapSegment s when s.id == segmentId => addPoint(p),
    _ => GestureResult.none(),
  };

  @override
  GestureResult<MapEditorMode> onDragEnd(DragEndGesture g) {
    final GestureResult<MapEditorMode> correct = GestureResult.run(
      CorrectSegmentFromSketch(segmentId: segmentId, correction: path),
      then: leaveSketch,
    );

    if (g.dragged is MapSketchPencil) return correct;

    return switch (g.target) {
      MapSegment s when s.id == segmentId => correct,
      TopologyObject s => GestureResult.run(
        SpliceSegment(
          segmentId: segmentId,
          correction: path,
          startAnchor: SegmentAnchor(segmentId),
          endAnchor: s.anchor,
        ),
        then: leaveSketch,
      ),
      _ => GestureResult.none(),
    };
  }
}
