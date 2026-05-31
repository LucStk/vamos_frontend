import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import "waypoint_marker_factory.dart";

class WaypointsLayer extends ConsumerWidget {
  const WaypointsLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('WaypointsLayer rebuild');

    final tripId = ref.watch(currentTripIdProvider);

    final waypointsIds = ref.watch(
      mapStateProvider(
        tripId,
      ).select((s) => s.waypoints.map((w) => w.id).toList()),
    );

    return DragMarkers(
      markers: waypointsIds.map((wId) {
        return buildMarker(ref, context, tripId, wId);
      }).toList(),
    );
  }
}
