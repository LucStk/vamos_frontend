import 'package:topology_application/domain/segment_overlay.dart';
import 'package:topology_application/helpers/gis.dart';
import 'package:topology_engine/runtime/observables/observable_node.dart';

typedef ObservableFactory = ObservableNode Function();

class SegmentsOverlayStore {
  final Map<SegmentId, SegmentOverlay> _segmentsOverlay = {};
  SegmentsOverlayStore();

  SegmentOverlay? get(SegmentId segmentId) => _segmentsOverlay[segmentId];

  void set(SegmentId segmentId, Geometry geometry) {
    // Création d'un OverlaySegment à poser à la place de la vraie geometry
    _segmentsOverlay[segmentId] = SegmentOverlay(geometry: geometry);
  }

  void remove(SegmentId segmentId) {
    _segmentsOverlay.remove(segmentId);
  }
}
