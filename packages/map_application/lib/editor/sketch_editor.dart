// lib/editor/vertex_editor.dart
import 'package:map_application/editor/map_editor.dart';
import 'package:trip_application/topology/domain/domain.dart';
import 'entities/entities.dart';

// lib/editor/vertex_editor.dart
extension SketchEditor on MapEditor {
  Future<void> activateSketchMode() async {
    if (selection.vertexIdOrNull case final vertex?) {
      mode = MapMode.sketchMode(
        vertexStart: vertex.id,
        itineraire: [vertex.latLng],
        mobilityType: MobilityType.bike,
      );
    }
  }

  Future<void> deactivateSketchMode() async {
    mode = Idle();
  }
}
