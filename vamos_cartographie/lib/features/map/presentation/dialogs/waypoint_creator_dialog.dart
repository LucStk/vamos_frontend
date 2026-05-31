import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "waypoint_form_dialog.dart";

class WaypointCreatorDialog extends ConsumerWidget {
  final int tripId;
  final LatLng latLng;

  const WaypointCreatorDialog({
    super.key,
    required this.tripId,
    required this.latLng,
  });

  static Future<void> show({
    required BuildContext context,
    required LatLng latLng,
    required int tripId,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WaypointCreatorDialog(tripId: tripId, latLng: latLng),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WaypointFormDialog(
      initialWaypoint: WaypointDraft(latLng: latLng),

      successMessage: 'Waypoint créé',

      onSubmit: (ref, editedWaypoint) async {
        await ref
            .read(mapStateProvider(tripId).notifier)
            .createWaypointRemote(editedWaypoint);
      },
    );
  }
}
