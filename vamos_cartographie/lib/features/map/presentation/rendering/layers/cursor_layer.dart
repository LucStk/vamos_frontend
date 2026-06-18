import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/map_mode.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/elements/cursor/cursor_marker.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class CursorLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const CursorLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapCtrl = ref.read(mapCtrlProvider(tripId).notifier);
    final mapState = ref.watch(mapCtrlProvider(tripId));
    switch (mapState.mode) {
      case CursorDrawn cursorDrawn:
        return DragMarkers(
          markers: [
            DragMarker(
              point: cursorDrawn.latLng,
              size: Size(32, 32),
              builder: (BuildContext context, LatLng latLng, bool isDragging) {
                return CursorMarker(tripId: tripId, isDragging: isDragging);
              },
              onTap: (LatLng latLng) => mapCtrl.onUiEvent(CursorTapped(latLng)),
              onDragStart: (_, _) => mapCtrl.onUiEvent(CursorDraggedStart()),
              onDragEnd: (details, latLng) =>
                  mapCtrl.onUiEvent(CursorDraggedend(latLng)),
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
