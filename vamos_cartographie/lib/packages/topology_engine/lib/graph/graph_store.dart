import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/domain/domain.dart';
import 'package:topology_engine/graph/observable_collection_store.dart';
import 'topology_index.dart';

typedef SegmentId = Id<Segment>;
typedef VertexId = Id<Vertex>;

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex = TopologyIndex();
  final segmentStore = ObservableCollectionStore<Segment>();
  final vertexStore = ObservableCollectionStore<Vertex>();

  GraphStore();

  void clear() {
    segmentStore.clear();
    vertexStore.clear();
  }
}
