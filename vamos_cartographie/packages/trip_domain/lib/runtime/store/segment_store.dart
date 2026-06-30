import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:trip_domain/domain/types/Ids.dart';

class SegmentStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex = TopologyIndex();
  final store = ObservableCollectionStore<Segment>();

  SegmentStore();

  void insert(Segment segment) => store.insert(segment);
  void update(Segment segment) => store.update(segment);
  void remove(SegmentId id) => store.remove(id);
  void clear() => store.clear();
}

extension SegmentGetters on SegmentStore {
  (VertexId, VertexId) getVerticesfromSegment(SegmentId segmentId) {
    final res = topologyIndex.getVerticesOf(segmentId);
    return (res.$1, res.$2);
  }

  Set<SegmentId> segmentsFromVertex(VertexId vertexId) {
    return topologyIndex.getEdgesConnectedTo(vertexId);
  }
}
