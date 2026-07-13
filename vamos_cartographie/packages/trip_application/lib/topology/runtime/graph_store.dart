import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/entities/entities.dart';

import '/shared/shared.dart';

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex = TopologyIndex();
  final segmentStore = CollectionStore<Segment>();
  final vertexStore = CollectionStore<Vertex>();

  GraphStore();
  void upsertSegment(Segment segment) =>
      segmentStore.upsert(NodeState<Segment>.patchEntity(segment));
  void commitSegment(Segment serverSegment) =>
      segmentStore.getNode(serverSegment.id)?.commit(serverSegment);

  void removeSegment(SegmentId sId) => segmentStore.remove(sId);
  void rollbackSegment(SegmentId sId) => segmentStore.getNode(sId)?.rollback();

  void upsertVertex(Vertex vertex) =>
      vertexStore.upsert(NodeState<Vertex>.patchEntity(vertex));
  void commitVertex(Vertex serverVertex) =>
      vertexStore.getNode(serverVertex.id)?.commit(serverVertex);
  void removeVertex(VertexId vId) => vertexStore.remove(vId);
  void rollbackVertex(VertexId sId) => vertexStore.getNode(sId)?.rollback();

  void clear() {
    segmentStore.clear();
    vertexStore.clear();
  }
}
