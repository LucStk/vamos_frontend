import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/features.dart';

import 'package:vamos_cartographie/packages/topology_application/queries/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/packages/topology_application/queries/projections/segment_overlay_provider.dart';

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
