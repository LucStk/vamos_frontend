import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:vamos_cartographie/core/type/id.dart";
import "package:vamos_cartographie/features/features.dart";
import "package:vamos_cartographie/features/graph/graph.dart";
import "package:vamos_cartographie/features/waypoints/application/orchestrators/waypoint_orchestrator.dart";

import "form_waypoint_dialog.dart";
import "package:vamos_cartographie/features/shared/shared.dart";

class EditWaypointDialog extends ConsumerWidget {
  final Id<Waypoint> waypointId;
  final Id<Trip> tripId;

  const EditWaypointDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
  });

  static Future<void> show({
    required BuildContext context,
    required Id<Waypoint> waypointId,
    required Id<Trip> tripId,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          EditWaypointDialog(waypointId: waypointId, tripId: tripId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref
        .read(tripGraphProvider(tripId))
        .requireValue
        .map<Waypoint>()[waypointId]
        ?.value;
    if (waypoint == null) {
      return const DialogErrorBody(errorMessage: 'Waypoint introuvable');
    }

    return FormWaypointDialog(
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
