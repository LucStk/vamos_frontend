import 'package:map_engine/domain/domain.dart';
import 'package:trip_application/topology/topology.dart';
import 'package:vamos_cartographie/trip_map/domain/domain.dart';
import 'package:vamos_cartographie/trip_map/transitions/trip_map_state_transitions.dart';

extension SketchTransitions on TripMapStateTransitions {
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
