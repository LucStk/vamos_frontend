import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'segment_line_factory.dart';
import 'segment_type_marker_factory.dart';
import 'middle_vertex_marker_factory.dart';
import 'ghost_marker_factory_v2.dart';

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
    final List<Marker> middleVertexMarkers = [];
    final List<Marker> ghostMarkers = [];

    for (int segmentId in segmentsIds) {
      var line = buildLine(ref, context, tripId, segmentId);
      if (line != null) polylines.add(line);

      var typeMarker = buildTypeMarker(ref, context, tripId, segmentId);
      if (typeMarker != null && typeMarker.isNotEmpty) {
        typeMarkers.addAll(typeMarker);
      }

      // Markers pour les middleVertices draggables
      var middleMarkers = buildMiddleVertexMarkers(
        ref,
        context,
        tripId,
        segmentId,
      );
      if (middleMarkers.isNotEmpty) {
        middleVertexMarkers.addAll(middleMarkers);
      }

      // Ghost markers entre chaque vertex
      var ghosts = buildGhostMarkersV2(ref, context, tripId, segmentId);
      if (ghosts.isNotEmpty) {
        ghostMarkers.addAll(ghosts);
      }
    }

    if (polylines.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        PolylineLayer(polylines: polylines),
        MarkerLayer(markers: ghostMarkers),
        MarkerLayer(markers: middleVertexMarkers),
        MarkerLayer(markers: typeMarkers),
      ],
    );
  }
}
