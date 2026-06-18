import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_state.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/map_mode.dart';
import 'package:vamos_cartographie/features/map/interaction/ui_events/ui_events.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/layer_abstract.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';

class CursorLayer extends AbstractLayer {
  const CursorLayer({super.key, required super.tripId});

  @override
  Widget buildWithCtrl(
    BuildContext context,
    WidgetRef ref,
    MapCtrl mapCtrl,
    MapState mapState,
  ) {
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
