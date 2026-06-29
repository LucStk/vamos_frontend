import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:domain_core/domain_core.dart";
import "package:trip_domain/domain/domain.dart";
import "package:vamos_cartographie/core/injection/queries/waypoint_ui_queries.dart";

import "form_waypoint_dialog.dart";
import "package:vamos_cartographie/features/shared/shared.dart";

class EditWaypointDialog extends ConsumerWidget {
  final WaypointId waypointId;
  final Id<Trip> tripId;
  final VoidCallback? onSuccess;
  const EditWaypointDialog({
    super.key,
    required this.waypointId,
    required this.tripId,
    this.onSuccess,
  });

  static Future<void> show({
    required BuildContext context,
    required WaypointId waypointId,
    required Id<Trip> tripId,
    VoidCallback? onSuccess,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => EditWaypointDialog(
        waypointId: waypointId,
        tripId: tripId,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.read(waypointUiProvider(waypointId));
    if (waypoint == null) {
      return const DialogErrorBody(errorMessage: 'Waypoint introuvable');
    }

    return FormWaypointDialog(
      initialWaypoint: waypoint,
      onSuccess: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Point mis à jour")));

        if (onSuccess != null) onSuccess!();
      },
      onSubmit: (ref, editedWaypoint) async {
        debugPrint("edited : $editedWaypoint");
        throw ("edit_waypoint_dialog onSubmit not implemented");
      },
    );
  }
}
