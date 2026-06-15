import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/application/providers/cursor_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/cursor_marker_view.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/marker_wt_menu_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";

class CursorLayer extends AbstractLayer {
  const CursorLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ─────────────────────────────────────────────
    /// 1. STRUCTURE ONLY (ajout / suppression vertices)
    /// ─────────────────────────────────────────────
    final cursor = ref.watch(mapCursorProvider);
    final cursorNotifier = ref.watch(mapCursorProvider.notifier);

    return DragMarkers(
      markers: [
        DragMarker(
          point: cursor.latLng,
          size: Size(32, 32),
          builder: (BuildContext context, LatLng latLng, bool isDragging) {
            return MarkerWtMenuShell(
              isDragging: isDragging,
              marker: CursorMarkerView(tripId: tripId),
              controller: cursorNotifier.overlayPortalController,
            );
          },
          onDragEnd: (details, latLng) => cursorNotifier.setPosition(latLng),
        ),
      ],
    );
  }
}
