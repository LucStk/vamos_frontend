import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/machine/map_mode.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/adapters/drag_marker_adapter.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/models/markers/marker_ui_element.dart';
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
            toDragMarker(CursorUiElement(cursorDrawn.latLng), tripId, mapCtrl),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
