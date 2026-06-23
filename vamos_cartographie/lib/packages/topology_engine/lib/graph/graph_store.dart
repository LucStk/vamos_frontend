import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/domain/domain.dart';
import 'topology_index.dart';
import "nodes/collection_node.dart";

typedef SegmentId = Id<Segment>;
typedef VertexId = Id<Vertex>;

class GraphStore {
  late CollectionNode<Segment> segmentStore;
  late CollectionNode<Vertex> vertexStore;
  late ObservableFactory observableFactory;
  final TopologyIndex<VertexId, SegmentId> topologyIndex = TopologyIndex();

  GraphStore({
    required ObservableNode segmentObserver,
    required ObservableNode vertexObserver,
  }) {
    segmentStore = CollectionNode<Segment>(observableNode: segmentObserver);
    vertexStore = CollectionNode<Vertex>(observableNode: vertexObserver);
  }

  void clear() {
    segmentStore.clear();
    vertexStore.clear();
  }
}
