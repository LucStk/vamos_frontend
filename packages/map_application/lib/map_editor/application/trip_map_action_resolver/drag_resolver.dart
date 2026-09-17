import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'gestures_resolver.dart';

extension PointerDragStartEditor on DragStartAction {
  GestureResolution resolve(GestureResolutionContext context) {
    switch (context.editorState) {
      case SketchMode s when s.selection is MapSketchPencil:
        return GestureResolution(editorState: s.copyWith(selection: null));

      case _:
        return GestureResolution(editorState: context.editorState);
    }
  }
}

extension PointerDragUpdateEditor on DragUpdateAction {
  GestureResolution resolve(GestureResolutionContext context) {
    final latLng = context.camera.worldOffsetToLatLng(offset);

    switch ((context.editorState, dragged, target)) {
      case (SketchMode m, MapSketchPencil _, MapObject? e):
        return GestureResolution(
          editorState: m.copyWith(path: [...m.path, latLng], selection: e),
        );

      case _:
        return GestureResolution(editorState: context.editorState);
    }
  }
}

extension PointerDragEndEditor on DragEndAction {
  GestureResolution resolve(GestureResolutionContext context) {
    switch ((context.editorState, dragged, target)) {
      case (SketchCreation m, MapSketchPencil _, MapVertex v):
        return GestureResolution(
          editorState: m,
          effects: [
            CreateSegmentFromSketchEffect(
              startVertexId: m.vertexStart,
              endVertexId: v.id,
              geometry: m.path,
              mobilityType: m.mobilityType,
            ),
          ],
        );

      case (SketchCreation m, MapSketchPencil _, MapSegment s):
        return GestureResolution(
          editorState: context.editorState,
          effects: [
            SpliceSegmentEffect(
              startAnchor: VertexAnchor(m.vertexStart),
              endAnchor: SegmentAnchor(s.id),
              correction: m.path,
              segmentId: s.id,
            ),
          ],
        );

      case (SketchEdition m, MapSketchPencil _, MapSegment s)
          when s.id == m.segmentId:
        return GestureResolution(
          editorState: m,
          effects: [
            CorrectSegmentFromSketchEffect(
              segmentId: m.segmentId,
              correction: m.path,
            ),
          ],
        );

      case (SketchEdition m, MapSketchPencil _, TopologyObject s):
        return GestureResolution(
          editorState: context.editorState,
          effects: [
            SpliceSegmentEffect(
              startAnchor: SegmentAnchor(m.segmentId),
              endAnchor: s.anchor,
              correction: m.path,
              segmentId: m.segmentId,
            ),
          ],
        );

      case _:
        return GestureResolution(editorState: context.editorState);
    }
  }
}
