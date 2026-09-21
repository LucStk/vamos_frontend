import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

GestureResult<MapEditorMode> handleDragStart(
  MapEditorMode mode,
  DragStartGesture gesture,
) {
  switch ((mode, gesture.dragged)) {
    case (SketchMode s, _) when s.selection is MapSketchPencil:
      return GestureResult(mode: s.copyWith(selection: null));
    case _:
      return GestureResult();
  }
}

GestureResult<MapEditorMode> handleDragging(
  MapEditorMode mode,
  DraggingGesture gesture,
  LatLng latLng,
) {
  switch ((mode, gesture.dragged)) {
    case (SketchMode m, MapSketchPencil _):
      return GestureResult(
        mode: m.copyWith(path: [...m.path, latLng], selection: gesture.target),
      );

    case _:
      return GestureResult();
  }
}

GestureResult<MapEditorMode> handleDragEnd(
  MapEditorMode mode,
  DragEndGesture gesture,
) {
  switch ((mode, gesture.dragged, gesture.target)) {
    case (SketchCreation m, MapSketchPencil _, MapVertex v):
      return GestureResult(
        command: CreateSegmentFromSketch(
          startVertexId: m.vertexStart,
          endVertexId: v.id,
          geometry: m.path,
          mobilityType: m.mobilityType,
        ),
      );

    case (SketchCreation m, MapSketchPencil _, MapSegment s):
      return GestureResult(
        command: SpliceSegment(
          startAnchor: VertexAnchor(m.vertexStart),
          endAnchor: SegmentAnchor(s.id),
          correction: m.path,
          segmentId: s.id,
        ),
      );

    case (SketchCreation m, MapSketchPencil _, null):
      return GestureResult(
        command: CreateSegmentFromSketch(
          startVertexId: m.vertexStart,
          geometry: m.path,
          mobilityType: m.mobilityType,
        ),
      );

    case (SketchEdition m, MapSketchPencil _, _):
      return GestureResult(
        command: CorrectSegmentFromSketch(
          segmentId: m.segmentId,
          correction: m.path,
        ),
      );

    case (SketchEdition m, _, MapSegment s) when s.id == m.segmentId:
      return GestureResult(
        command: CorrectSegmentFromSketch(
          segmentId: m.segmentId,
          correction: m.path,
        ),
      );

    case (SketchEdition m, _, TopologyObject s):
      return GestureResult(
        command: SpliceSegment(
          startAnchor: SegmentAnchor(m.segmentId),
          endAnchor: s.anchor,
          correction: m.path,
          segmentId: m.segmentId,
        ),
      );

    case _:
      return GestureResult();
  }
}
