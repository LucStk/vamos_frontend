part of '../../map_editor_mode.dart';

@freezed
abstract class SketchCreation extends MapEditorMode
    with SketchMode, _$SketchCreation {
  const SketchCreation._();

  factory SketchCreation({
    required VertexId vertexStart,
    required List<LatLng> path,
    required MobilityType mobilityType,
    VertexId? touchedVertex,
    MapObject? selection,
  }) = _SketchCreation;

  @override
  SketchCreation withPath(List<LatLng> path) => copyWith(path: path);

  @override
  SketchCreation withSelection(MapObject? selection) =>
      copyWith(selection: selection);

  @override
  Transition<MapEditorMode> onPointerDown(
    PointerDownGesture g,
    ScreenOffset p,
  ) {
    if (g.element is! MapSketchSegment) return Transition.stay();
    // final grab = closestPointOnPolyline(p, path);
    // return Transition(
    //   mode: copyWith(path: path.sublist(0, grab.segmentIndex)),
    // );
    return Transition.stay();
  }

  @override
  Transition<MapEditorMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapSketchPencil _:
        return Transition.overlay(SketchPencilMenu(g.offset));
      case _:
    }
    return Transition.stay();
  }

  // SketchCreation
  @override
  Transition<MapEditorMode> onDragEnd(DragEndGesture g) {
    if (g.dragged is! MapSketchPencil) return Transition.stay();

    return switch (g.target) {
      MapVertex v => Transition.run(
        CreateSegmentFromSketch(
          startVertexId: vertexStart,
          endVertexId: v.id,
          geometry: path,
          mobilityType: mobilityType,
        ),
        then: leaveSketch,
      ),
      MapSegment s => Transition.run(
        SpliceSegment(
          segmentId: s.id,
          correction: path,
          startAnchor: VertexAnchor(vertexStart),
          endAnchor: SegmentAnchor(s.id),
        ),
        then: leaveSketch,
      ),
      // null => Transition.run(
      //   CreateSegmentFromSketch(
      //     startVertexId: vertexStart,
      //     geometry: path,
      //     mobilityType: mobilityType,
      //   ),
      //   then: leaveSketch,
      // ),
      _ => Transition.stay(),
    };
  }
}
