import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/domain/entities/vertex.dart';
import 'package:trip_domain/domain/domain.dart';
import "form_waypoint_dialog.dart";

class CreateWaypointDialog extends ConsumerWidget {
  final Id<Trip> tripId;
  final Id<Vertex>? vertexId;
  final LatLng? latLng;
  final VoidCallback? onSuccess;
  const CreateWaypointDialog({
    super.key,
    required this.tripId,
    this.vertexId,
    this.latLng,
    this.onSuccess,
  });

  static Future<void> show({
    required BuildContext context,
    required Id<Trip> tripId,
    Id<Vertex>? vertexId,
    LatLng? latLng,
    VoidCallback? onSuccess,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => CreateWaypointDialog(
        tripId: tripId,
        vertexId: vertexId,
        latLng: latLng,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormWaypointDialog(
      initialWaypoint: Waypoint(),
      onSuccess: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Point Créé")));

        if (onSuccess != null) onSuccess!();
      },
      onSubmit: (ref, editedWaypoint) async {
        throw Exception("onSubmit to build");
      },
    );
  }
}
