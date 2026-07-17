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
  GraphStore insertSegment(SegmentRemoteModel segment) {
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

  void patchSegment(SegmentRemoteModel segment) {
    segmentStore.patchNode(SegmentPatchModel.fromFields(segment));
  }

  void setSegment(SegmentRemoteModel serverSegment) {
    segmentStore.set(serverSegment);
  }

  void rollbackSegment(SegmentId sId) => segmentStore.get(sId)?.rollback();

  GraphStore insertVertex(VertexRemoteModel vertex) {
    return copyWith(vertexStore: vertexStore.insertState(HasValue(vertex)));
  }

  void patchVertex(VertexRemoteModel vertex) {
    vertexStore.patchNode(VertexPatchModel.fromFields(vertex));
  }

  GraphStore removeVertex(VertexId vId) {
    return copyWith(vertexStore: vertexStore.remove(vId));
  }

  void setVertex(VertexRemoteModel serverVertex) {
    vertexStore.set(serverVertex);
  }

  void rollbackVertex(VertexId sId) => vertexStore.get(sId)?.rollback();

  GraphStore clear() {
    topologyIndex.clear();
    return copyWith(
      vertexStore: GraphCollectionStore<VertexFields>(),
      segmentStore: GraphCollectionStore<SegmentFields>(),
    );
  }
}
