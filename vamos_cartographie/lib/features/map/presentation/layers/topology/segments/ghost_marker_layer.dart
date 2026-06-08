import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import "waypoint_marker_factory.dart";

class GhostMarkerLayer extends AbstractLayer {
  const GhostMarkerLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segments = ref.watch(segmentMapProvider(tripId));

    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        for (final segment in segments.values)
          Marker(
            point: segment.geometry[segment.geometry.length ~/ 3],
            width: 20,
            height: 20,
            child: GestureDetector(
              onTap: () {
                SegmentViewerDialog.show(
                  context: context,
                  tripId: tripId,
                  segmentId: segment.id,
                );
              },
              child: SegmentTypeMarkerView(type: segment.type),
            ),
          ),
      ],
    );
  }
}
