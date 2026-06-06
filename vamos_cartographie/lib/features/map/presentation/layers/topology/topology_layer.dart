import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/topology/segments/segment_layer.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/topology/segments/segment_type_marker_layer.dart';
import 'package:vamos_cartographie/features/topology/application/providers/segments_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import "segments/segment_layer.dart";

class TopologyLayer extends AbstractLayer {
  const TopologyLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SegmentLayer(tripId: tripId),
        SegmentTypeMarkerLayer(tripId: tripId),
      ],
    );
  }
}

// final List<Polyline> polylines = [];
// final List<Marker> typeMarkers = [];
// final List<Marker> middleVertexMarkers = [];
// final List<Marker> ghostMarkers = [];

// for (int segmentId in segmentsIds) {
//   var line = buildLine(ref, context, tripId, segmentId);
//   if (line != null) polylines.add(line);

//   var typeMarker = buildTypeMarker(ref, context, tripId, segmentId);
//   if (typeMarker != null && typeMarker.isNotEmpty) {
//     typeMarkers.addAll(typeMarker);
//   }

//   // Markers pour les middleVertices draggables
//   var middleMarkers = buildMiddleVertexMarkers(
//     ref,
//     context,
//     tripId,
//     segmentId,
//   );
//   if (middleMarkers.isNotEmpty) {
//     middleVertexMarkers.addAll(middleMarkers);
//   }

//   // Ghost markers entre chaque vertex
//   var ghosts = buildGhostMarkersV2(ref, context, tripId, segmentId);
//   if (ghosts.isNotEmpty) {
//     ghostMarkers.addAll(ghosts);
//   }
// }

// if (polylines.isEmpty) {
//   return const SizedBox.shrink();
// }
