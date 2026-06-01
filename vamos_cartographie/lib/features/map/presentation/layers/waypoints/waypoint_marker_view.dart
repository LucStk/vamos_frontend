import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';

class WaypointMarkerView extends ConsumerWidget {
  final int waypointId;
  final int tripId;
  final bool isDragging;

  const WaypointMarkerView({
    super.key,
    required this.waypointId,
    required this.tripId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypointType = ref.watch(
      waypointProvider(tripId, waypointId).select((w) => (w?.type)),
    );
    if (waypointType == null) {
      throw Exception('WaypointMarkerViewError : Waypoint not found');
    }
    return Container(
      decoration: BoxDecoration(
        color: isDragging
            ? waypointType.color.withOpacity(0.7)
            : waypointType.color,
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
      child: Icon(waypointType.icon, color: Colors.white, size: 20),
    );
  }
}
