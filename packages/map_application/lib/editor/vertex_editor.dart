// lib/editor/vertex_editor.dart
import 'package:map_application/editor/map_editor.dart';
import 'entities/entities.dart';

// lib/editor/vertex_editor.dart
extension VertexEditor on MapEditor {
  Future<void> deleteSelectedVertex() async {
    if (selection.vertexIdOrNull case final vertex?) {
      selection = MapSelection.none();
      await graphEditor.removeVertex(vertex.id);
    }
  }

  Future<void> createWaypointFromSelectedVertex() async {
    if (selection.vertexIdOrNull case final vertex?) {
      selection = MapSelection.none();
      await waypointEditor.createBlankWaypointFromVertex(vertex.id);
    }
  }
}
