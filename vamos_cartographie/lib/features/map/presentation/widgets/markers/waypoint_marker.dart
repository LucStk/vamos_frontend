import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

class WaypointMarker extends StatelessWidget {
  final Waypoint waypoint;
  final bool isDragging;

  const WaypointMarker({
    super.key,
    required this.waypoint,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDragging
            ? waypoint.type.color.withOpacity(0.7)
            : waypoint.type.color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: isDragging ? 8 : 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(waypoint.type.icon, color: Colors.white, size: 20),
    );
  }
}
