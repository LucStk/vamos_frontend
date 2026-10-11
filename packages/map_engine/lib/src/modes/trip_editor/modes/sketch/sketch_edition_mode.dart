part of "../../map_editor_mode.dart";

class SketchEdition extends MapEditorMode with SketchMode {
  final SegmentId segmentId;
  const SketchEdition({required this.segmentId});

  @override
  Transition<MapEditorMode> onPointerDown(PressGesture g) =>
      switch (g.element) {
        // On saisit le segment édité : le croquis démarre à ce point.
        MapSegment s when s.id == segmentId => Transition.set(
          sketchTraceSlot,
          SketchTrace.from(g.position.world),
        ),
        _ => Transition.stay(),
      };

  @override
  Transition<MapEditorMode> onDragEnd(DragEndGesture g) =>
      Transition.withSlot(sketchTraceSlot, (trace) {
        final points = trace.points;

        final Transition<MapEditorMode> correct = Transition.run(
          CorrectSegmentFromSketch(segmentId: segmentId, correction: points),
          then: leaveSketch,
        );

        if (g.dragged is MapSketchPencil) return correct;

        return switch (g.target) {
          MapSegment s when s.id == segmentId => correct,
          TopologyObject s => Transition.run(
            SpliceSegment(
              segmentId: segmentId,
              correction: points,
              startAnchor: SegmentAnchor(segmentId),
              endAnchor: s.anchor,
            ),
            then: leaveSketch,
          ),
          _ => Transition.stay(),
        };
      });
}
