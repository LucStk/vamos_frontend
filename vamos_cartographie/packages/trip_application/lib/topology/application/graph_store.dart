import 'package:domain_core/domain_core.dart';

import 'topology_index.dart';
import 'package:trip_application/topology/domain/entities/entities.dart';

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
  GraphStore insertSegment(Segment segment) {
    // mutation en place de l'index, pas de recréation
    // topologyIndex.addRelationship(
    //   segment.id,
    //   segment.sourceVertexId,
    //   segment.targetVertexId,
    // );
    return copyWith(segmentStore: segmentStore.insertState(HasValue(segment)));
  }

  GraphStore removeSegment(SegmentId sId) {
    //topologyIndex.removeEdge(sId);
    return copyWith(segmentStore: segmentStore.remove(sId));
  }

  void patchSegment(Segment segment) {
    segmentStore.patchNode(segment.createPatch());
  }

  void setSegment(Segment serverSegment) {
    segmentStore.set(serverSegment);
  }

  void rollbackSegment(SegmentId sId) => segmentStore.get(sId)?.rollback();

  GraphStore insertVertex(Vertex vertex) {
    return copyWith(vertexStore: vertexStore.insertState(HasValue(vertex)));
  }

  void patchVertex(Vertex vertex) {
    vertexStore.patchNode(vertex.createPatch());
  }

  GraphStore removeVertex(VertexId vId) {
    return copyWith(vertexStore: vertexStore.remove(vId));
  }

  void setVertex(Vertex serverVertex) {
    vertexStore.set(serverVertex);
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
