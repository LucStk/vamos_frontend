import 'package:map_application/domain/domain.dart';
import 'package:map_application/transitions/map_editor_state_transitions.dart';
import 'package:trip_application/topology/topology.dart';

extension SketchTransitions on MapEditorStateTransitions {
  void activateSketchMode() {
    if (mapState.selection case MapVertex(:final id, :final position)) {
      mapState = SketchCreation(
        vertexStart: id,
        path: [position],
        mobilityType: MobilityType.bike,
      );
    }
  }

  void activateSegmentEditMode() async {
    if (mapState.selection case MapSegment(:final id)) {
      mapState = SketchEdition(segmentId: id, path: []);
    }
  }

  void deactivateSketchMode() async {
    mapState = Idle();
  }
}
