class TopologyIndex<V, E> {
  // Key: Vertex, Value: Les Edges (Segments) connectés
  final Map<V, Set<E>> _vertexToEdges = {};
  // Key: Edge, Value: Les deux Vertex (Source, Target)
  final Map<E, (V, V)> _edgeToVertices = {};

  void addRelationship(E edgeId, V vertexA, V vertexB) {
    _edgeToVertices[edgeId] = (vertexA, vertexB);

    _vertexToEdges.putIfAbsent(vertexA, () => {}).add(edgeId);
    _vertexToEdges.putIfAbsent(vertexB, () => {}).add(edgeId);
  }

  // Requête en O(1) : Trouver toutes les routes/segments touchant ce point
  Set<E> getEdgesConnectedTo(V vertexId) => _vertexToEdges[vertexId] ?? {};

  // Requête en O(1) : Trouver les extrémités de ce segment
  (V, V) getVerticesOf(E edgeId) {
    final res = _edgeToVertices[edgeId];
    if (res == null) {
      throw Exception("Edge with no Vertice in topology_index");
    }
    return res;
  }

  void removeEdge(E edgeId) {
    final pair = _edgeToVertices.remove(edgeId);
    if (pair != null) {
      _vertexToEdges[pair.$1]?.remove(edgeId);
      _vertexToEdges[pair.$2]?.remove(edgeId);
    }
  }
}
