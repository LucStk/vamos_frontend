import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_application/patches/segment_patch.dart';
import 'package:topology_application/patches/vertex_patch.dart';
import 'package:trip_domain/domain/types/Ids.dart';

class GraphPatchStore {
  final Map<SegmentId, SegmentPatch> segmentPatches = {};
  final Map<VertexId, VertexPatch> vertexPatches = {};

  final ObservableNode segmentObserver;
  final ObservableNode vertexObserver;
  GraphPatchStore(this.segmentObserver, this.vertexObserver);

  SegmentPatch? getSegment(SegmentId segmentId) => segmentPatches[segmentId];
  VertexPatch? getVertex(VertexId vertexId) => vertexPatches[vertexId];

  void setSegmentPatch(SegmentId segmentId, Geometry geometry) {
    // Création d'un OverlaySegment à poser à la place de la vraie geometry
    segmentPatches[segmentId] = SegmentPatch(geometryOverride: geometry);
    segmentObserver.notify();
  }

  void setVertexPatch(VertexId vertexId, LatLng latLng) {
    vertexPatches[vertexId] = VertexPatch(positionOverride: latLng);
    vertexObserver.notify();
  }

  void removeSegmentPatch(SegmentId segmentId) {
    segmentPatches.remove(segmentId);
    segmentObserver.notify();
  }

  void removeVertexPatch(VertexId vertexId) {
    vertexPatches.remove(vertexId);
    vertexObserver.notify();
  }

  void clear() {
    segmentPatches.clear();
    vertexPatches.clear();
    vertexObserver.notify();
    segmentObserver.notify();
  }
}
