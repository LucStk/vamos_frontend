// lib/editor/vertex_editor.dart
import 'package:map_application/map_application.dart';

// lib/editor/vertex_editor.dart
extension VertexEditor on MapEditor {
  Future<void> deleteSelectedVertex() async {
    if (selection case MapVertex(:final vertex)) {
      selection = NoMapElement();
      await graphEditor.removeVertex(vertex.id);
    }
  }

  Future<void> createWaypointFromSelectedVertex() async {
    if (selection case MapVertex(:final vertex)) {
      selection = NoMapElement();
      await waypointEditor.createBlankWaypointFromVertex(vertex.id);
    }
  }
}
