import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';

class WaypointMarkerView extends ConsumerWidget {
  final int waypointId;
  final bool isDragging;
  final int tripId;

  const WaypointMarkerView({
    super.key,
    required this.waypointId,
    required this.tripId,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoint = ref.watch(nodeRequiredProvider<Waypoint>(waypointId));
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
      ),
    );
  }
}
