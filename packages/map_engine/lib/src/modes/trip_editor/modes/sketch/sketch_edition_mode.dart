part of "../../map_editor_mode.dart";

@freezed
abstract class SketchEdition extends MapEditorMode
    with SketchMode, _$SketchEdition {
  const SketchEdition._();

  factory SketchEdition({
    required SegmentId segmentId,
    required List<LatLng> path,
  }) = _SketchEdition;

  @override
  Transition<MapEditorMode> onPointerDown(PressGesture g) =>
      switch (g.element) {
        MapSegment s when s.id == segmentId => addPoint(g.screen),
        _ => Transition.stay(),
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
      _ => Transition.stay(),
    };
  }
}
