import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/map/presentation/dialogs/dialogs.dart';
import "extensions/waypoint_drag_marker_x.dart";

DragMarker buildMarker(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int waypointId,
) {
  final waypoint = ref.watch(waypointProvider(tripId, waypointId));

  final notifier = ref.read(mapStateProvider(tripId).notifier);

  if (waypoint == null) {
    throw Exception('Waypoint not found');
  }

  return waypoint.toDragMarker(
    onDragUpdate: notifier.updateWaypointPositionLocal,
    onDragEnd: notifier.updateWaypointPositionLocal,
    onTap: (id) {
      WaypointViewerDialog.show(
        context: context,
        waypointId: id,
        tripId: tripId,
      );
    },
  );
}
