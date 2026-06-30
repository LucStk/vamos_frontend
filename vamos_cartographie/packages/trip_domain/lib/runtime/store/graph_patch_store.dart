import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';

class GraphPatchStore {
  final segmentPatchStore = ObservableCollectionStore<SegmentPatch>();
  final vertexPatchStore = ObservableCollectionStore<VertexPatch>();
  GraphPatchStore();

  SegmentPatch? getSegment(Id<Segment> segmentId) =>
      segmentPatchStore.get(segmentId as Id<SegmentPatch>);
  VertexPatch? getVertex(Id<Vertex> vertexId) =>
      vertexPatchStore.get(vertexId as Id<VertexPatch>);

  void insertSegmentPatch(SegmentPatch s) => segmentPatchStore.insert(s);
  void updateSegmentPatch(SegmentPatch s) => segmentPatchStore.update(s);
  void removeSegmentPatch(Id<SegmentPatch> id) => segmentPatchStore.remove(id);

  void insertVertexPatch(VertexPatch s) => vertexPatchStore.insert(s);
  void updateVertexPatch(VertexPatch s) => vertexPatchStore.update(s);
  void removeVertexPatch(Id<VertexPatch> id) => vertexPatchStore.remove(id);

  void clear() {
    segmentPatchStore.clear();
    vertexPatchStore.clear();
  }
}
