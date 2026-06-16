import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/map_marker.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/marker_wt_popMenu_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/menus/cursor_menu.dart';

class CursorMarker extends MapMarker {
  const CursorMarker({
    super.key,
    required super.tripId,
    super.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapStateProvider(tripId).notifier);
    return MarkerWtPopmenuShell(
      isDragging: isDragging,
      tripId: tripId,
      latLng: mapState.mapCursor.latLng,
      popMenu: CursorMenu(tripId: tripId),
      child: Icon(Icons.place_sharp, size: 30, color: Colors.black),
    );
  }
}
