// lib/editor/vertex_editor.dart
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/domain/domain.dart';

// lib/editor/vertex_editor.dart
extension SketchEditor on MapEditor {
  Future<void> activateSketchMode() async {
    if (selection case MapVertex(:final vertex)) {
      mode = SketchCreation(
        vertexStart: vertex.id,
        itineraire: [vertex.latLng],
        mobilityType: MobilityType.bike,
      );
      selection = NoMapElement();
    }
  }

  Future<void> deactivateSketchMode() async {
    mode = Idle();
  }
}
