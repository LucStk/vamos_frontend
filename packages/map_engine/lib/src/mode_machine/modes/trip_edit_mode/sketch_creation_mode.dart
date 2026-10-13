part of '../trip_edit_mode.dart';

class SketchCreation extends TripEditMode with SketchMode {
  const SketchCreation();

  @override
  Transition<TripEditMode> onPointerDown(PressGesture g) {
    if (g.element is! MapSketchSegment) return Transition.stay();
    // final grab = closestPointOnPolyline(p, path);
    // return Transition(
    //   mode: copyWith(path: path.sublist(0, grab.segmentIndex)),
    // );
    return Transition.stay();
  }

  // @override
  // Transition<TripEditMode> onTap(TapGesture g) {
  //   switch (g.element) {
  //     case MapSketchPencil _:
  //       return Transition.overlay(SketchPencilMenu(g.offset));
  //     case _:
  //   }
  //   return Transition.stay();
  // }

  // SketchCreation
  @override
  Transition<TripEditMode> onDragEnd(DragEndGesture g) {
    if (g.dragged is! MapSketchPencil) return Transition.stay();

    return Transition.withSlot(sketchTraceSlot, (trace) {
      return switch (g.target) {
        MapVertex _ => Transition.run(
          CreateSegmentFromSketch(
            geometry: trace.points,
            mobilityType: trace.mobilityType,
          ),
          then: leaveSketch,
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
