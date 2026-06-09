import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "package:vamos_cartographie/features/waypoints/application/providers/waypoints_notifier.dart";
import "waypoint_form_dialog.dart";

class WaypointCreatorDialog extends ConsumerWidget {
  final int tripId;
  final int? vertexId;
  final LatLng? latLng;
  const WaypointCreatorDialog({
    super.key,
    required this.tripId,
    this.vertexId,
    this.latLng,
  });

  static Future<void> show({
    required BuildContext context,
    required int tripId,
    int? vertexId,
    LatLng? latLng,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WaypointCreatorDialog(
        tripId: tripId,
        vertexId: vertexId,
        latLng: latLng,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WaypointFormDialog(
      initialWaypoint: WaypointDraft(),
      successMessage: 'Waypoint créé',
      onSubmit: (ref, editedWaypoint) async {
        await ref
            .read(waypointsProvider(tripId).notifier)
            .createWaypoint(editedWaypoint, vertexId, latLng);
      },
    );
  }
}
