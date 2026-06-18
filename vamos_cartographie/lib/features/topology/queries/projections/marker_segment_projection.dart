import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/topology/queries/projections/segment_derived_provider.dart';
import 'package:vamos_cartographie/features/topology/runtime/helpers/gis.dart';

part 'marker_segment_projection.g.dart';

@riverpod
LatLng resolvedMarkerSegment(Ref ref, Id<Trip> tripId, Id<Segment> segmentId) {
  final geometry = ref.watch(
    resolvedSegmentGeometryProvider(tripId, segmentId),
  );

  return boundsCenter(geometry);
}
