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
  GestureResult<MapEditorMode> onPointerDown(
    PointerDownGesture g,
    ScreenOffset p,
  ) {
    if (g.element is! MapSketchSegment) return GestureResult.none();
    // final grab = closestPointOnPolyline(p, path);
    // return GestureResult(
    //   mode: copyWith(path: path.sublist(0, grab.segmentIndex)),
    // );
    return GestureResult.none();
  }

  @override
  GestureResult<MapEditorMode> onTap(TapGesture g) {
    switch (g.element) {
      case MapSketchPencil _:
        return GestureResult.decorate(SketchPencilMenu(g.offset));
      case _:
    }
    return GestureResult.none();
  }

  // SketchCreation
  @override
  GestureResult<MapEditorMode> onDragEnd(DragEndGesture g) {
    if (g.dragged is! MapSketchPencil) return GestureResult.none();

    return switch (g.target) {
      MapVertex v => GestureResult.run(
        CreateSegmentFromSketch(
          startVertexId: vertexStart,
          endVertexId: v.id,
          geometry: path,
          mobilityType: mobilityType,
        ),
        then: leaveSketch,
      ),
      MapSegment s => GestureResult.run(
        SpliceSegment(
          segmentId: s.id,
          correction: path,
          startAnchor: VertexAnchor(vertexStart),
          endAnchor: SegmentAnchor(s.id),
        ),
        then: leaveSketch,
      ),
      // null => GestureResult.run(
      //   CreateSegmentFromSketch(
      //     startVertexId: vertexStart,
      //     geometry: path,
      //     mobilityType: mobilityType,
      //   ),
      //   then: leaveSketch,
      // ),
      _ => GestureResult.none(),
    };
  }
}
