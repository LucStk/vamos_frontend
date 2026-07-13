import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/entities/entities.dart';

import '/shared/shared.dart';

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex = TopologyIndex();
  final segmentStore = CollectionStore<Segment>();
  final vertexStore = CollectionStore<Vertex>();

  GraphStore();

  void clear() {
    segmentStore.clear();
    vertexStore.clear();
  }
}
