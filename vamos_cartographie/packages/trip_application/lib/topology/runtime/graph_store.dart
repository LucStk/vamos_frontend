import 'package:trip_application/topology/domain/entities/entities.dart';
import 'package:trip_application/topology/runtime/topology_index.dart';

import '/shared/shared.dart';

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex;
  final CollectionStore<Segment> segmentStore;
  final CollectionStore<Vertex> vertexStore;

  const GraphStore({
    required this.topologyIndex,
    required this.segmentStore,
    required this.vertexStore,
  });

  GraphStore.initial()
    : topologyIndex = TopologyIndex(),
      segmentStore = const CollectionStore(),
      vertexStore = const CollectionStore();

  GraphStore copyWith({
    CollectionStore<Segment>? segmentStore,
    CollectionStore<Vertex>? vertexStore,
  }) {
    return GraphStore(
      topologyIndex: topologyIndex, // toujours la même instance
      segmentStore: segmentStore ?? this.segmentStore,
      vertexStore: vertexStore ?? this.vertexStore,
    );
  }
}

extension GraphStoreActions on GraphStore {
  GraphStore upsertSegment(Segment segment) {
    // mutation en place de l'index, pas de recréation
    // topologyIndex.addRelationship(
    //   segment.id,
    //   segment.sourceVertexId,
    //   segment.targetVertexId,
    // );
    return copyWith(
      segmentStore: segmentStore.upsert(
        NodeState<Segment>.patchEntity(segment),
      ),
    );
  }

  GraphStore removeSegment(SegmentId sId) {
    //topologyIndex.removeEdge(sId);
    return copyWith(segmentStore: segmentStore.remove(sId));
  }

  void commitSegment(Segment serverSegment) {
    segmentStore.getNode(serverSegment.id)?.commit(serverSegment);
  }

  void rollbackSegment(SegmentId sId) => segmentStore.getNode(sId)?.rollback();

  GraphStore upsertVertex(Vertex vertex) {
    return copyWith(
      vertexStore: vertexStore.upsert(NodeState<Vertex>.patchEntity(vertex)),
    );
  }

  GraphStore removeVertex(VertexId vId) {
    return copyWith(vertexStore: vertexStore.remove(vId));
  }

  void commitVertex(Vertex serverVertex) {
    vertexStore.getNode(serverVertex.id)?.commit(serverVertex);
  }

  void rollbackVertex(VertexId sId) => vertexStore.getNode(sId)?.rollback();

  void clear() {
    segmentStore.clear();
    vertexStore.clear();
  }
}
