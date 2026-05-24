import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:vamos_cartographie/domain/domain.dart';

class WaypointMarkersBuilder {
  /// Construit les markers statiques des waypoints (visibles dans les deux modes).
  /// [onTap] est appelé avec l'index du waypoint tapé.
  static List<Marker> buildMarkers(
    Trip trip,
    void Function(Waypoint waypoint) onTap,
  ) {
    final markers = <Marker>[];

    for (var i = 0; i < trip.waypoints.length; i++) {
      final wp = trip.waypoints[i];
      final index = i;

      markers.add(
        Marker(
          point: wp.latLng,
          width: 36,
          height: 36,
          child: GestureDetector(
            onTap: () => onTap(wp),
            child: _WaypointIcon(waypoint: wp),
          ),
        ),
      );
    }

    return markers;
  }
}

class _WaypointIcon extends StatelessWidget {
  final Waypoint waypoint;

  const _WaypointIcon({required this.waypoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: waypoint.type.color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Icon(waypoint.type.icon, color: Colors.white, size: 20),
    );
  }
}
