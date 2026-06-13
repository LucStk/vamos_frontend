import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/application/orchestrators/waypoint_orchestrator.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import "waypoint_form_dialog.dart";

class WaypointCreatorDialog extends ConsumerWidget {
  final Id<Trip> tripId;
  final Id<Vertex>? vertexId;
  final LatLng? latLng;
  const WaypointCreatorDialog({
    super.key,
    required this.tripId,
    this.vertexId,
    this.latLng,
  });

  static Future<void> show({
    required BuildContext context,
    required Id<Trip> tripId,
    Id<Vertex>? vertexId,
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
            .read(waypointOrchestratorProvider(tripId).notifier)
            .createWaypoint(editedWaypoint, vertexId, latLng);
      },
    );
  }
}
