import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';

import '../selectors/graph_selectors.dart';
import 'segment_overlay_provider.dart';

part 'segment_derived_provider.g.dart';

@riverpod
List<LatLng> resolvedSegmentGeometry(
  Ref ref,
  Id<Trip> tripId,
  Id<Segment> segmentId,
) {
  final segment = ref.watch(nodeRequiredProvider<Segment>(tripId, segmentId));

  final overlay = ref.watch(segmentOverlayProvider(tripId, segmentId));

  return overlay.geometryOverride ?? segment.geometry;
}
