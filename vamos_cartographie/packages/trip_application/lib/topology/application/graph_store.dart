import 'topology_index.dart';
import 'package:trip_application/topology/domain/entities/entities.dart';

import '/shared/shared.dart';

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex;
  final GraphCollectionStore<Segment> segmentStore;
  final GraphCollectionStore<Vertex> vertexStore;

  const GraphStore({
    required this.topologyIndex,
    required this.segmentStore,
    required this.vertexStore,
  });

  GraphStore.initial()
    : topologyIndex = TopologyIndex(),
      segmentStore = const GraphCollectionStore(),
      vertexStore = const GraphCollectionStore();

  GraphStore copyWith({
    GraphCollectionStore<Segment>? segmentStore,
    GraphCollectionStore<Vertex>? vertexStore,
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
      segmentStore: segmentStore.upsertState(
        NodeState<Segment>.patchEntity(segment),
      ),
    );
  }

  GraphStore removeSegment(SegmentId sId) {
    //topologyIndex.removeEdge(sId);
    return copyWith(segmentStore: segmentStore.remove(sId));
  }

  void commitSegment(Segment serverSegment) {
    segmentStore.get(serverSegment.id)?.commit(serverSegment);
  }

  void rollbackSegment(SegmentId sId) => segmentStore.get(sId)?.rollback();

  GraphStore upsertVertex(Vertex vertex) {
    return copyWith(
      vertexStore: vertexStore.upsertState(
        NodeState<Vertex>.patchEntity(vertex),
      ),
    );
  }

  GraphStore removeVertex(VertexId vId) {
    return copyWith(vertexStore: vertexStore.remove(vId));
  }

  void commitVertex(Vertex serverVertex) {
    vertexStore.get(serverVertex.id)?.commit(serverVertex);
  }

  void rollbackVertex(VertexId sId) => vertexStore.get(sId)?.rollback();

  GraphStore clear() {
    topologyIndex.clear();
    return copyWith(
      vertexStore: GraphCollectionStore<Vertex>(),
      segmentStore: GraphCollectionStore<Segment>(),
    );
  }
}
