import 'package:latlong2/latlong.dart';
import 'package:map_application/application/segment_commands.dart';
import 'package:map_application/domain/gesture_result_model.dart';
import 'package:map_editor_application/application/sketch_handler.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:map_engine/controller/domain/map_gesture.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:trip_application/topology/topology.dart';

final class SketchEditionHandler extends SketchHandler {
  const SketchEditionHandler(this.mode);

  @override
  final SketchEdition mode;

  @override
  GestureResult<MapEditorMode> onPointerDown(PointerDownGesture g, LatLng p) =>
      switch (g.element) {
        MapSegment s when s.id == mode.segmentId => GestureResult(
          mode: mode.copyWith(path: [p]),
        ),
        _ => GestureResult.none(),
      };

  @override
  GestureResult<MapEditorMode> onDragEnd(DragEndGesture g) {
    final correct = GestureResult<MapEditorMode>(
      command: CorrectSegmentFromSketch(
        segmentId: mode.segmentId,
        correction: mode.path,
      ),
    );

    if (g.dragged is MapSketchPencil) return correct;

    return switch (g.target) {
      MapSegment s when s.id == mode.segmentId => correct,
      TopologyObject s => GestureResult(
        command: SpliceSegment(
          segmentId: mode.segmentId,
          correction: mode.path,
          startAnchor: SegmentAnchor(mode.segmentId),
          endAnchor: s.anchor,
        ),
      ),
      _ => GestureResult.none(),
    };
  }
}
