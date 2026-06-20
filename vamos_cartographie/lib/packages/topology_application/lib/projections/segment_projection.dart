import 'package:topology_application/helpers/gis.dart';
import 'package:topology_application/runtime/store/segments_overlay_store.dart';
import 'package:topology_engine/domain/entities/segment.dart';
import 'package:topology_engine/runtime/store/store.dart';

class SegmentProjection {
  final SegmentsOverlayStore overlayStore;
  final GraphStore store;

  SegmentProjection(this.store, this.overlayStore);

  Geometry segmentGeometry(SegmentId segmentId) {
    final res = overlayStore.get(segmentId);
    if (res == null) {
      return store.getRequired<Segment>(segmentId).geometry;
    }
    return res.geometry;
  }

  Geometry mobilityMarkers(SegmentId segmentId) {
    final res = store.getRequired<Segment>(segmentId);
    return boundsCenter(res.geometry) as Geometry;
  }
}
