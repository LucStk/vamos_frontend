import 'package:map_application/map_editor/application/application.dart';
import 'package:map_application/map_editor/domain/domain.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

extension MapEditorControllerGestures on MapEditorController {
  void dragStartResolve(DragStartGesture gesture) {
    switch ((editorMode, gesture.dragged)) {
      case (SketchMode s, _) when s.selection is MapSketchPencil:
        editorMode = s.copyWith(selection: null);

      case _:
    }
  }

  void dragUpdateResolve(DraggingGesture gesture) {
    final latLng = camera.worldOffsetToLatLng(gesture.offset);

    switch ((editorMode, gesture.dragged)) {
      case (SketchMode m, MapSketchPencil _):
        editorMode = m.copyWith(
          path: [...m.path, latLng],
          selection: gesture.target,
        );

      case _:
    }
  }

  void dragEndResolve(DragEndGesture gesture) {
    switch ((editorMode, gesture.dragged, gesture.target)) {
      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        executeEffect(
          () => createSegmentFromSketch(
            startVertexId: m.vertexStart,
            endVertexId: v.id,
            geometry: m.path,
            mobilityType: m.mobilityType,
          ),
        );

      case (SketchCreation m, MapSketchPencil _, MapSegment s):
        executeEffect(
          () => spliceSegment(
            startAnchor: VertexAnchor(m.vertexStart),
            endAnchor: SegmentAnchor(s.id),
            correction: m.path,
            segmentId: s.id,
          ),
        );

      case (SketchCreation m, MapSketchPencil _, null):
        executeEffect(
          () => createSegmentFromSketch(
            startVertexId: m.vertexStart,
            geometry: m.path,
            mobilityType: m.mobilityType,
          ),
        );

      case (SketchEdition m, MapSketchPencil _, _):
        executeEffect(
          () => correctSegmentFromSketch(
            segmentId: m.segmentId,
            correction: m.path,
          ),
        );

      case (SketchEdition m, _, MapSegment s) when s.id == m.segmentId:
        executeEffect(
          () => correctSegmentFromSketch(
            segmentId: m.segmentId,
            correction: m.path,
          ),
        );

      case (SketchEdition m, _, TopologyObject s):
        executeEffect(
          () => spliceSegment(
            startAnchor: SegmentAnchor(m.segmentId),
            endAnchor: s.anchor,
            correction: m.path,
            segmentId: m.segmentId,
          ),
        );

      case _:
    }
  }
}
