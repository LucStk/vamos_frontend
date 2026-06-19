import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';

import 'package:vamos_cartographie/packages/topology_application/queries/projections/segment_overlay.dart';

part 'segment_overlay_provider.g.dart';

@riverpod
class SegmentOverlayNotifier extends _$SegmentOverlayNotifier {
  @override
  SegmentOverlay build(Id<Trip> tripId, Id<Segment> segmentId) {
    return const SegmentOverlay();
  }

  void setGeometry(List<LatLng> geometry) {
    state = state.copyWith(geometryOverride: geometry, recomputing: true);
  }

  void commit() {
    state = state.copyWith(geometryOverride: null, recomputing: false);
  }

  void fail(Object error) {
    state = state.copyWith(recomputing: false, error: error);
  }
}
