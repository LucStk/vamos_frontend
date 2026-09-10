// lib/editor/vertex_editor.dart
import 'package:map_application/map_application.dart';

// lib/editor/vertex_editor.dart
extension VertexEditor on MapContext {
  Future<void> deleteSelectedVertex() async {
    if (selection case MapVertex(:final id)) {
      selection = null;
      await graphEditor.removeVertex(id);
    }
  }

  Future<void> createWaypointFromSelectedVertex() async {
    if (selection case MapVertex(:final id)) {
      selection = null;
      await waypointEditor.createBlankWaypointFromVertex(id);
    }
  }
}
