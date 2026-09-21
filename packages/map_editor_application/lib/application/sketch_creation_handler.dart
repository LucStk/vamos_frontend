import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_editor_application/application/sketch_handler.dart';
import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/utiles/polyline_dist.dart';
import 'package:trip_application/trip_application.dart';

final class SketchCreationHandler extends SketchHandler {
  const SketchCreationHandler(this.mode);

  @override
  final SketchCreation mode;

  @override
  GestureResult<MapEditorMode> onPointerDown(PointerDownGesture g, LatLng p) {
    if (g.element is! MapSketchSegment) return GestureResult.none();
    final grab = closestPointOnPolyline(p, mode.path);
    return GestureResult(
      mode: mode.copyWith(path: mode.path.sublist(0, grab.segmentIndex)),
    );
  }

  @override
  GestureResult<MapEditorMode> onDragEnd(DragEndGesture g) {
    if (g.dragged is! MapSketchPencil) return GestureResult.none();

    return switch (g.target) {
      MapVertex v => GestureResult(
        command: CreateSegmentFromSketch(
          startVertexId: mode.vertexStart,
          endVertexId: v.id,
          geometry: mode.path,
          mobilityType: mode.mobilityType,
        ),
      ),
      MapSegment s => GestureResult(
        command: SpliceSegment(
          segmentId: s.id,
          correction: mode.path,
          startAnchor: VertexAnchor(mode.vertexStart),
          endAnchor: SegmentAnchor(s.id),
        ),
      ),
      null => GestureResult(
        command: CreateSegmentFromSketch(
          startVertexId: mode.vertexStart,
          geometry: mode.path,
          mobilityType: mode.mobilityType,
        ),
      ),
      _ => GestureResult.none(),
    };
  }
}
