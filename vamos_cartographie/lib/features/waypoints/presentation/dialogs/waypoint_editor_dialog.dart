import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/features/features.dart";
import "package:vamos_cartographie/features/graph/graph.dart";
import "package:vamos_cartographie/features/waypoints/application/orchestrators/waypoint_orchestrator.dart";
import "waypoint_form_dialog.dart";

import "package:vamos_cartographie/features/shared/shared.dart";

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
    final waypoint = ref
        .read(graphStoreProvider(tripId))
        .map<Waypoint>()[waypointId]
        ?.value;
    if (waypoint == null) {
      return const DialogErrorBody(errorMessage: 'Waypoint introuvable');
    }

    return WaypointFormDialog(
      initialWaypoint: waypoint.toDraft(),
      successMessage: 'Waypoint mis à jour',
      onSubmit: (ref, editedWaypoint) async {
        debugPrint("edited : $editedWaypoint");
        await ref
            .read(waypointOrchestratorProvider(tripId).notifier)
            .updateWaypoint(waypointId, waypoint.vertexId, editedWaypoint);
      },
    );
  }
}
