import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/topology/domain/entities/vertex.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/waypoint_creator_dialog.dart';

class VertexMarkerView extends ConsumerWidget {
  final Id<Trip> tripId;
  final Id<Vertex> vertexId;
  const VertexMarkerView({
    super.key,
    required this.tripId,
    required this.vertexId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        WaypointCreatorDialog.show(
          context: context,
          tripId: tripId,
          vertexId: vertexId,
          latLng: null,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.circle,
          size: 8,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
