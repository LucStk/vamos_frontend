import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/derived/segment_derived_provider.dart';
import 'package:vamos_cartographie/features/graph/helpers/gis.dart';

part 'marker_segment_projection.g.dart';

@riverpod
LatLng resolvedMarkerSegment(Ref ref, Id<Trip> tripId, Id<Segment> segmentId) {
  final geometry = ref.watch(
    resolvedSegmentGeometryProvider(tripId, segmentId),
  );

  return boundsCenter(geometry);
}
