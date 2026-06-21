import 'package:topology_engine/domain/entities/segment.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:topology_engine/graph/graph_store.dart';
import 'package:topology_engine/graph/nodes/observable_node.dart';

class GraphMutator {
  final GraphStore store;

  GraphMutator(this.store);

  void commitCreateSegment(Segment serverEntity, ObservableNode observer) {
    store.segmentStore.add(serverEntity, observer);
  }

  void commitUpdateSegment(SegmentId id, Segment serverValue) {
    final node = store.segmentStore.getNodeRequired(id);
    node.set(serverValue);
  }

  void commitDeleteSegment(SegmentId id) => store.segmentStore.remove(id);

  void commitCreateVertex(Vertex serverEntity, ObservableNode observer) {
    store.vertexStore.add(serverEntity, observer);
  }

  void commitUpdateVertex(VertexId id, Vertex serverValue) {
    final node = store.vertexStore.getNodeRequired(id);
    node.set(serverValue);
  }

  void commitDeleteVertex(VertexId id) => store.vertexStore.remove(id);
}
