import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/features/map/presentation/layers/layer_abstract.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/create_waypoint_dialog.dart';

import 'package:vamos_cartographie/features/map/presentation/controllers/controllers.dart';

class CursorLayer extends AbstractLayer {
  const CursorLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ─────────────────────────────────────────────
    /// 1. STRUCTURE ONLY (ajout / suppression vertices)
    /// ─────────────────────────────────────────────
    final cursor = ref.watch(mapCursorProvider(tripId));
    final cursorNotifier = ref.watch(mapCursorProvider(tripId).notifier);

    if (!cursor.isOpen) {
      return SizedBox.shrink();
    }
    return DragMarkers(
      markers: [
        DragMarker(
          point: cursor.latLng,
          size: Size(32, 32),
          builder: (BuildContext context, LatLng latLng, bool isDragging) {
            return CursorMarker(tripId: tripId, isDragging: isDragging);
          },
          onTap: (LatLng? latLng) {
            CreateWaypointDialog.show(
              context: context,
              tripId: tripId,
              latLng: latLng,
              onSuccess: () {
                cursorNotifier.close();
              },
            );
          },
          onDragStart: (_, _) => cursorNotifier.hidePopUp(),
          onDragEnd: (details, latLng) => cursorNotifier.setPosition(latLng),
        ),
      ],
    );
  }
}
