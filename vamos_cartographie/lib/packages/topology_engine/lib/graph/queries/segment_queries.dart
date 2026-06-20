import 'package:topology_engine/domain/entities/segment.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:topology_engine/graph/graph_store.dart';

class SegmentQueries {
  final GraphStore store;

  SegmentQueries(this.store);

  Map<SegmentId, Segment> collection() {
    return store.segmentStore.getAll();
  }

  (Vertex, Vertex) getVertices(SegmentId segmentId) {
    final res = store.topologyIndex.getVerticesOf(segmentId);
    return (
      store.vertexStore.getRequired(res.$1),
      store.vertexStore.getRequired(res.$2),
    );
  }

  Set<SegmentId> segmentsFromVertex(VertexId vertexId) {
    return store.topologyIndex.getEdgesConnectedTo(vertexId);
  }
}
