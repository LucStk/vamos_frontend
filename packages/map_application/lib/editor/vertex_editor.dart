// lib/editor/vertex_editor.dart
import 'package:map_application/domain/domain.dart';
import 'package:map_application/editor/map_editor.dart';

// lib/editor/vertex_editor.dart
extension VertexEditor on MapEditor {
  Future<void> deleteSelectedVertex() async {
    if (state.selection.vertexIdOrNull case final vertex?) {
      state = state.copyWith(selection: MapSelection.none());
      await graphEditor.removeVertex(vertex.id);
    }
  }

  Future<void> createWaypointFromSelectedVertex() async {
    if (state.selection.vertexIdOrNull case final vertex?) {
      state = state.copyWith(selection: MapSelection.none());
      await waypointEditor.createBlankWaypointFromVertex(vertex.id);
    }
  }
}
