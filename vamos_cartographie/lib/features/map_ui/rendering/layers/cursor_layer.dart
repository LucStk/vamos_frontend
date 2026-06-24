import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_mode.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/adapters/marker_adapter.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/cursor/cursor_ui_element.dart';

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
            toDragMarker(
              CursorUiElement(tripId, cursorDrawn.latLng),
              tripId,
              mapCtrl,
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
