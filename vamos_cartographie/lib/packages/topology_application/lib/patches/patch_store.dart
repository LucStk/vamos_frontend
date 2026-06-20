import 'package:latlong2/latlong.dart';
import 'package:topology_application/patches/segment_patch.dart';
import 'package:topology_application/patches/vertex_patch.dart';
import 'package:topology_engine/domain/types/geometry.dart';
import 'package:topology_engine/graph/graph_store.dart';

class PatchStore {
  final Map<SegmentId, SegmentPatch> segmentPatches = {};
  final Map<VertexId, VertexPatch> vertexPatches = {};
  PatchStore();

  SegmentPatch? get(SegmentId segmentId) => segmentPatches[segmentId];

  void setSegmentPatch(SegmentId segmentId, Geometry geometry) {
    // Création d'un OverlaySegment à poser à la place de la vraie geometry
    segmentPatches[segmentId] = SegmentPatch(geometryOverride: geometry);
  }

  void setVertexPatch(VertexId vertexId, LatLng latLng) {
    vertexPatches[vertexId] = VertexPatch(positionOverride: latLng);
  }

  void removeSegmentPatch(SegmentId segmentId) {
    segmentPatches.remove(segmentId);
  }

  void clear() {
    segmentPatches.clear();
    vertexPatches.clear();
  }
}
