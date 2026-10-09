part of "../../map_editor_mode.dart";

@freezed
abstract class SketchEdition extends MapEditorMode
    with SketchMode, _$SketchEdition {
  const SketchEdition._();

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
  Transition<MapEditorMode> onPointerDown(
    PointerDownGesture g,
    ScreenOffset p,
  ) => switch (g.element) {
    MapSegment s when s.id == segmentId => addPoint(p),
    _ => Transition.none(),
  };

  @override
  Transition<MapEditorMode> onDragEnd(DragEndGesture g) {
    final Transition<MapEditorMode> correct = Transition.run(
      CorrectSegmentFromSketch(segmentId: segmentId, correction: path),
      then: leaveSketch,
    );

    if (g.dragged is MapSketchPencil) return correct;

    return switch (g.target) {
      MapSegment s when s.id == segmentId => correct,
      TopologyObject s => Transition.run(
        SpliceSegment(
          segmentId: segmentId,
          correction: path,
          startAnchor: SegmentAnchor(segmentId),
          endAnchor: s.anchor,
        ),
        then: leaveSketch,
      ),
      _ => Transition.none(),
    };
  }
}
