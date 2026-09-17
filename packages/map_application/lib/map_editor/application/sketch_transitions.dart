import 'package:map_application/map_application.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:trip_application/topology/topology.dart';

extension SketchTransitions on MapEditorController {
  void activateSketchMode() {
    if (editorMode.selection case MapVertex(:final id, :final position)) {
      editorMode = SketchCreation(
        vertexStart: id,
        path: [position],
        mobilityType: MobilityType.bike,
      );
    }
  }

  void activateSegmentEditMode() async {
    if (editorMode.selection case MapSegment(:final id)) {
      editorMode = SketchEdition(segmentId: id, path: []);
    }
  }

  void deactivateSketchMode() async {
    editorMode = Idle();
  }
}
