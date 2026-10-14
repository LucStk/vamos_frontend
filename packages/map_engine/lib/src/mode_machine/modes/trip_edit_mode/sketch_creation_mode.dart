part of '../../app_mode.dart';

class SketchCreation extends TripEditMode with SketchMode {
  const SketchCreation(super.tripId);

  @override
  Transition<AppMode> onPointerDown(PressGesture g) {
    if (g.element is! MapSketchSegment) return Transition.stay();
    // final grab = closestPointOnPolyline(p, path);
    // return Transition(
    //   mode: copyWith(path: path.sublist(0, grab.segmentIndex)),
    // );
    return Transition.stay();
  }

  // @override
  // Transition<AppMode> onTap(TapGesture g) {
  //   switch (g.element) {
  //     case MapSketchPencil _:
  //       return Transition.overlay(SketchPencilMenu(g.offset));
  //     case _:
  //   }
  //   return Transition.stay();
  // }

  // SketchCreation
  @override
  Transition<AppMode> onDragEnd(DragEndGesture g) {
    if (g.dragged is! MapSketchPencil) return Transition.stay();

    return Transition.withSlot(sketchTraceSlot, (trace) {
      return switch (g.target) {
        MapVertex _ => Transition.run(
          CreateSegmentFromSketch(
            geometry: trace.points,
            mobilityType: trace.mobilityType,
          ),
          then: (current, SegmentRemoteModel m) {
            return Transition.to(
              IdleEditor(tripId),
            ).and(selectionSlot, MapSegment(id: m.id, tripId: tripId));
          },
        ),

        _ => Transition.stay(),
      };
    });

    // MapSegment s => Transition.run(
    //   SpliceSegment(
    //     segmentId: s.id,
    //     correction: path,
    //     startAnchor: VertexAnchor(vertexStart),
    //     endAnchor: SegmentAnchor(s.id),
    //   ),
    //   then: leaveSketch,
    // ),
    // null => Transition.run(
    //   CreateSegmentFromSketch(
    //     startVertexId: vertexStart,
    //     geometry: path,
    //     mobilityType: mobilityType,
    //   ),
    //   then: leaveSketch,
    // ),
  }
}
