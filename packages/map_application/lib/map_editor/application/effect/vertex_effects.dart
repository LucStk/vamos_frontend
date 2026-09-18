import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:trip_application/topology/topology.dart';

extension VertexEffects on MapEditorController {
  Future<void> createSimpleVertex(LatLng position) async {
    await graphEditor.createSimpleVertex(position);
  }

  Future<void> updateRemoteVertexPosition(
    VertexId vertexId,
    LatLng position,
  ) async {
    await graphEditor.moveVertex(vertexId, position);
  }

  Future<void> removeVertex(VertexId vertexId) async {
    await graphEditor.removeVertex(vertexId);
  }

  Future<void> deleteSelectedVertex() async {
    if (mode.selection case MapVertex(:final id)) {
      final initialSelection = mode.selection;
      await graphEditor.removeVertex(id);
      // On vérifie que la selection n'as pas évolue entre temps
      if (mode.selection == initialSelection) {
        mode = mode.withSelection(null);
      }
    }
  }
}

extension WaypointEffects on MapEditorController {
  Future<void> createWaypointFromVertex(VertexId vertexId) async {
    await waypointEditor.createBlankWaypointFromVertex(vertexId);
  }

  Future<void> createWaypointFromPosition(LatLng position) async {
    await waypointEditor.createBlankWaypointFromPosition(position);
  }
}
