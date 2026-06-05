import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "package:vamos_cartographie/features/waypoints/application/waypoints_notifier.dart";
import "waypoint_form_dialog.dart";

class WaypointCreatorDialog extends ConsumerWidget {
  final int tripId;
  final int vertexId;

  const WaypointCreatorDialog({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  static Future<void> show({
    required BuildContext context,
    required int tripId,
    required int vertexId,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WaypointCreatorDialog(tripId: tripId, vertexId: vertexId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WaypointFormDialog(
      initialWaypoint: WaypointDraft(),
      successMessage: 'Waypoint créé',
      onSubmit: (ref, editedWaypoint) async {
        await ref
            .read(waypointsStoreProvider(tripId).notifier)
            .createWaypointRemote(editedWaypoint, vertexId);
      },
    );
  }
}
