import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import "package:vamos_cartographie/features/map/presentation/widgets/markers/waypoint_marker_view.dart";

import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';

class WaypointMarkerLayer extends AbstractLayer {
  const WaypointMarkerLayer({super.key, required super.tripId});

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

// DragMarker buildMarker(
//   WidgetRef ref,
//   BuildContext context,
//   int tripId,
//   int waypointId,
// ) {
//   debugPrint("WaypointMarker rebuild $waypointId");
//   final latLng = ref.watch(waypointLatLngProvider(tripId, waypointId));
//   final type = ref.watch(
//     waypointProvider(tripId, waypointId).select((w) => (w?.type)),
//   );
//   final notifier = ref.read(waypointsStoreProvider(tripId).notifier);
//   if (latLng == null) {
//     throw Exception('Waypoint not found');
//   }

//   return DragMarker(
//     key: ValueKey("marker_$waypointId"),
//     size: const Size(36, 36),
//     point: latLng,
//     onDragEnd: (details, LatLng latLng) {
//       notifier.updateWaypointPositionRemote(waypointId, latLng);
//     },
//     onDragUpdate: (DragUpdateDetails details, LatLng latLng) {
//       // notifier.updateWaypointPositionLocal(waypointId, latLng);
//     },
//     builder: (_, _, isDragging) {
//       return WaypointMarkerView(
//         key: ValueKey("marker_wp_view_$waypointId"),
//         waypointId: waypointId,
//         tripId: tripId,
//         isDragging: isDragging,
//         type: type!,
//       );
//     },
//     // onTap: (id) {
//     //   //
//     // },
//   );
// }
