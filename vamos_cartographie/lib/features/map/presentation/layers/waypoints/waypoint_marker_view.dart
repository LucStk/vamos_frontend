import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

import 'package:vamos_cartographie/features/map/presentation/dialogs/dialogs.dart';

class WaypointMarkerView extends ConsumerWidget {
  final int waypointId;
  final int tripId;
  final bool isDragging;
  final WaypointType type;

  const WaypointMarkerView({
    super.key,
    required this.waypointId,
    required this.tripId,
    required this.type,
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
