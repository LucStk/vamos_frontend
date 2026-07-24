import 'package:domain_core/domain_core.dart';

import 'topology_index.dart';
import 'package:trip_application/topology/domain/entities/entities.dart';

class GraphStore {
  final TopologyIndex<VertexId, SegmentId> topologyIndex;
  final GraphCollectionStore<SegmentFields> segmentStore;
  final GraphCollectionStore<VertexFields> vertexStore;

  const GraphStore({
    required this.topologyIndex,
    required this.segmentStore,
    required this.vertexStore,
  });

  GraphStore.initial()
    : topologyIndex = TopologyIndex(),
      segmentStore = const GraphCollectionStore<SegmentFields>(),
      vertexStore = const GraphCollectionStore<VertexFields>();

  GraphStore copyWith({
    GraphCollectionStore<SegmentFields>? segmentStore,
    GraphCollectionStore<VertexFields>? vertexStore,
  }) {
    return GraphStore(
      topologyIndex: topologyIndex, // toujours la même instance
      segmentStore: segmentStore ?? this.segmentStore,
      vertexStore: vertexStore ?? this.vertexStore,
    );
  }
}

extension GraphStoreActions on GraphStore {
  GraphStore insertSegment(SegmentFields segment) {
    // mutation en place de l'index, pas de recréation
    // topologyIndex.addRelationship(
    //   segment.id,
    //   segment.sourceVertexId,
    //   segment.targetVertexId,
    // );
    return copyWith(segmentStore: segmentStore.insertState(segment));
  }

  GraphStore removeSegment(SegmentId sId) {
    //topologyIndex.removeEdge(sId);
    return copyWith(segmentStore: segmentStore.remove(sId));
  }

  GraphStore setSegment(SegmentFields segment) {
    return copyWith(segmentStore: segmentStore.setNode(segment));
  }

  GraphStore rollbackSegment(SegmentId sId) {
    return copyWith(segmentStore: segmentStore.rollbackNode(sId));
  }

  GraphStore insertVertex(VertexFields vertex) {
    return copyWith(vertexStore: vertexStore.insertState(vertex));
  }

  GraphStore removeVertex(VertexId vId) {
    return copyWith(vertexStore: vertexStore.remove(vId));
  }

  GraphStore setVertex(VertexFields serverVertex) {
    return copyWith(vertexStore: vertexStore.setNode(serverVertex));
  }

  GraphStore rollbackVertex(VertexId sId) {
    return copyWith(vertexStore: vertexStore.rollbackNode(sId));
  }

  GraphStore clear() {
    topologyIndex.clear();
    return copyWith(
      vertexStore: GraphCollectionStore<VertexFields>(),
      segmentStore: GraphCollectionStore<SegmentFields>(),
    );
  }
}
