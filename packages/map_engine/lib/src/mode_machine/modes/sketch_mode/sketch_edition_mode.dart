part of "../../app_mode.dart";

final class SketchEdition extends TripEditableMode with SketchMode {
  final SectionId segmentId;
  const SketchEdition(super.tripId, {required this.segmentId});

  @override
  Transition<AppMode> onPointerDown(PressGesture g) => switch (g.element) {
    // On saisit le segment édité : le croquis démarre à ce point.
    MapSegment s when s.id == segmentId => Transition.set(
      sketchTraceSlot,
      SketchTrace.from(g.position.world),
    ),
    _ => Transition.stay(),
  };

  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) => Transition.stay();
  //       Transition.withSlot(sketchTraceSlot, (trace) {
  //         final points = trace.points;
  //
  //         final Transition<AppMode> correct = Transition.run(
  //           CorrectSegmentFromSketch(segmentId: segmentId, correction: points),
  //           then: (current, done) {
  //             final editor = current.modeAs<SketchMode>();
  //             if (editor == null) return null;
  //             return Transition.to(TripViewMode(editor.tripId));
  //           },
  //         );
  //
  //         if (g.dragged is MapSketchPencil) return correct;
  //
  //         return switch (g.target) {
  //           MapSegment s when s.id == segmentId => correct,
  //           TopologyObject s => Transition.run(
  //             SpliceSegment(
  //               segmentId: segmentId,
  //               correction: points,
  //               startAnchor: RouteAnchor(id: segmentId),
  //               endAnchor: s.anchor,
  //             ),
  //             then: (current, done) {
  //               final editor = current.modeAs<SketchMode>();
  //               if (editor == null) return null;
  //               return Transition.to(TripEditMode(editor.tripId));
  //             },
  //           ),
  //           _ => Transition.stay(),
  //         };
  // });
}
