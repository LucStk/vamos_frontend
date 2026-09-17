import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_engine/visual/domain/map_objects.dart';
import 'package:trip_application/topology/topology.dart';

extension VertexEffects on MapEditorController {
  Future<MapEditorMode?> createSimpleVertex(LatLng position) async {
    await graphEditor.createSimpleVertex(position);
    return null;
  }

  Future<MapEditorMode?> updateRemoteVertexPosition(
    VertexId vertexId,
    LatLng position,
  ) async {
    await graphEditor.moveVertex(vertexId, position);
    return null;
  }

  Future<MapEditorMode?> removeVertex(VertexId vertexId) async {
    await graphEditor.removeVertex(vertexId);
    return null;
  }

  Future<MapEditorMode?> deleteSelectedVertex() async {
    if (mapState.selection case MapVertex(:final id)) {
      await graphEditor.removeVertex(id);
      return mapState.withSelection(null);
    }

    return null;
  }
}

extension WaypointEffects on MapEditorController {
  Future<MapEditorMode?> createWaypointFromVertex(VertexId vertexId) async {
    await waypointEditor.createBlankWaypointFromVertex(vertexId);
    return null;
  }

  Future<MapEditorMode?> createWaypointFromPosition(LatLng position) async {
    await waypointEditor.createBlankWaypointFromPosition(position);
    return null;
  }
}
