import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:topology_engine/graph/graph_store.dart';

class VertexQueries {
  final GraphStore store;

  VertexQueries(this.store);

  Map<VertexId, Vertex> collection() {
    return store.vertexStore.getAll();
  }
}
