import 'package:map_application/map_application.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:trip_application/topology/topology.dart';

extension SketchTransitions on MapEditorController {
  void activateSketchMode() {
    if (mode.selection case MapVertex(:final id, :final position)) {
      mode = SketchCreation(
        vertexStart: id,
        path: [position],
        mobilityType: MobilityType.bike,
      );
    }
  }

  void activateSegmentEditMode() {
    if (mode.selection case MapSegment(:final id)) {
      mode = SketchEdition(segmentId: id, path: []);
    }
  }

  void deactivateSketchMode() {
    mode = Idle();
  }
}
