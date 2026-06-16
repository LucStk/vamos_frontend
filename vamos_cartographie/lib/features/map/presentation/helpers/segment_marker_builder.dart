import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/application/providers/display_segment_providers.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/segment_type_marker.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

Marker buildSegmentMarker({
  required BuildContext context,
  required WidgetRef ref,
  required Id<Trip> tripId,
  required Id<Segment> segmentId,
}) {
  final LatLng latLng = ref.watch(
    segmentMarkerLatLngProvider(tripId, segmentId),
  );
  return Marker(
    point: latLng,
    width: 20,
    height: 20,
    child: GestureDetector(
      onTap: () {
        SegmentViewerDialog.show(
          context: context,
          tripId: tripId,
          segmentId: segmentId,
        );
      },
      child: SegmentTypeMarker(tripId: tripId, segmentId: segmentId),
    ),
  );
}
