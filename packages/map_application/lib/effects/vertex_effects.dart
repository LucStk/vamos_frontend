part of 'map_effects.dart';

extension VertexMapEffects on MapEffects {
  Future<void> createSimpleVertex(LatLng position) {
    return graphEditor.createSimpleVertex(position);
  }

  Future<void> updateRemoteVertexPosition({
    required VertexId vertexId,
    required LatLng position,
  }) {
    return graphEditor.moveVertex(vertexId, position);
  }

  Future<void> createWaypointFromVertex(VertexId vertexId) {
    return waypointEditor.createBlankWaypointFromVertex(vertexId);
  }

  Future<void> createWaypointFromPosition(LatLng position) async {
    await waypointEditor.createBlankWaypointFromPosition(position);
  }

  Future<void> removeVertex(VertexId vertexId) {
    return graphEditor.removeVertex(vertexId);
  }

  Future<void> deleteSelectedVertex() async {
    if (mapState.selection case MapVertex(:final id)) {
      mapState = mapState.withSelection(null);
      await graphEditor.removeVertex(id);
    }
  }
}
