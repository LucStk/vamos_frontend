import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:trip_domain/domain/types/Ids.dart';

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex = TopologyIndex();
  final segmentStore = ObservableCollectionStore<Segment>();
  final vertexStore = ObservableCollectionStore<Vertex>();

  GraphStore();

  void insertSegment(Segment segment) => segmentStore.insert(segment);
  void updateSegment(Segment segment) => segmentStore.update(segment);
  void removeSegment(SegmentId id) => segmentStore.remove(id);

  void insertVertex(Vertex vertex) => vertexStore.insert(vertex);
  void updateVertex(Vertex vertex) => vertexStore.update(vertex);
  void removeVertex(VertexId id) => vertexStore.remove(id);

  void clear() {
    segmentStore.clear();
    vertexStore.clear();
  }
}

extension SegmentGetters on GraphStore {
  (Vertex, Vertex) getVerticesfromSegment(SegmentId segmentId) {
    final res = topologyIndex.getVerticesOf(segmentId);
    return (vertexStore.getRequired(res.$1), vertexStore.getRequired(res.$2));
  }

  Set<SegmentId> segmentsFromVertex(VertexId vertexId) {
    return topologyIndex.getEdgesConnectedTo(vertexId);
  }
}

extension VertexGetters on GraphStore {}
