import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/segments/markers/segment_type_marker_view.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/waypoints/waypoint_marker_factory.dart';
import "segment_line_factory.dart";
import "segment_type_marker_factory.dart";

class SegmentsLayer extends ConsumerWidget {
  const SegmentsLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = ref.watch(currentTripIdProvider);
    final segmentsIds = ref.watch(segmentIdsProvider(tripId));

    if (segmentsIds.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Polyline> polylines = [];
    final List<Marker> typeMarkers = [];

    for (int segmentId in segmentsIds) {
      var line = buildLine(ref, context, tripId, segmentId);
      if (line != null) polylines.add(line);
      var typeMarker = buildTypeMarker(ref, context, tripId, segmentId);
      if (typeMarker != null && typeMarker.isNotEmpty) {
        typeMarkers.addAll(typeMarker);
      }
    }

    if (polylines.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        PolylineLayer(polylines: polylines),
        MarkerLayer(markers: typeMarkers),
      ],
    );
  }
}
