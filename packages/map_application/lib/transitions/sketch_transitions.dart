import 'package:map_application/domain/domain.dart';
import 'package:map_application/transitions/map_editor_state_transitions.dart';
import 'package:trip_application/topology/topology.dart';

extension SketchTransitions on MapEditorStateTransitions {
  void activateSketchMode() {
    switch (mapState.selection) {
      case MapVertex(:final id, :final position):
        mapState = SketchCreation(
          vertexStart: id,
          itineraire: [position],
          mobilityType: MobilityType.bike,
        );
      case _:
    }
  }
}
