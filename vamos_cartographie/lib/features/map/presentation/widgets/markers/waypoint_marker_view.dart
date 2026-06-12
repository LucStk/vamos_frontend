import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

class WaypointMarkerView extends ConsumerWidget {
  final int waypointId;
  final bool isDragging;

  const WaypointMarkerView({
    super.key,
    required this.waypointId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onDoubleTap: () {
        WaypointViewerDialog.show(
          context: context,
          waypointId: waypointId,
          tripId: tripId,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDragging ? type.color.withOpacity(0.7) : type.color,
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
        child: Icon(type.icon, color: Colors.white, size: 20),
      ),
    );
  }
}
