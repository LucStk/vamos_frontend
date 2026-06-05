import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/shared/shared.dart';
import "package:vamos_cartographie/features/waypoints/application/waypoints_notifier.dart";
import "waypoint_form_dialog.dart";

class WaypointEditorDialog extends ConsumerWidget {
  final int waypointId;
  final int tripId;

  const WaypointEditorDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  static Future<void> show({
    required BuildContext context,
    required int waypointId,
    required int tripId,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          WaypointEditorDialog(waypointId: waypointId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(waypointProvider(tripId, waypointId));

    if (waypoint == null) {
      return const DialogErrorBody(errorMessage: 'Waypoint introuvable');
    }

    return WaypointFormDialog(
      initialWaypoint: waypoint.toDraft(),

      successMessage: 'Waypoint mis à jour',

      onSubmit: (ref, editedWaypoint) async {
        debugPrint("edited : $editedWaypoint");
        await ref
            .read(waypointsStoreProvider(tripId).notifier)
            .updateWaypointRemote(waypointId, editedWaypoint);
      },
    );
  }
}
