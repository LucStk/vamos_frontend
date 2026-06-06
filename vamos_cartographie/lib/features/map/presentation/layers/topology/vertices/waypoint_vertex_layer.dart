import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import "waypoint_marker_factory.dart";

class WaypointsLayer extends AbstractLayer {
  const WaypointsLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypointsIds = ref.watch(waypointsIdsProvider(tripId));
    debugPrint("Built WaypoinsLayer");
    return DragMarkers(
      markers: waypointsIds.map((wId) {
        return buildMarker(ref, context, tripId, wId);
      }).toList(),
    );
  }
}
