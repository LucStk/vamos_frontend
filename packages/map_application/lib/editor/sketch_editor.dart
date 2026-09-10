// lib/editor/vertex_editor.dart
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/domain/domain.dart';

// lib/editor/vertex_editor.dart
extension SketchEditor on MapContext {
  Future<void> activateSketchMode() async {
    if (selection case MapVertex(:final id, :final position)) {
      mode = SketchCreation(
        vertexStart: id,
        itineraire: [position],
        mobilityType: MobilityType.bike,
      );
      selection = null;
    }
  }

  Future<void> deactivateSketchMode() async {
    mode = Idle();
  }
}
