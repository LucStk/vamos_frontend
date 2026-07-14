import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/rendering/widgets/selected_widget.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/waypoint/waypoint.dart';

class VertexMarker extends ConsumerWidget {
  final TripId tripId;
  final VertexId vertexId;
  final bool isDragging;

  const VertexMarker({
    super.key,
    required this.tripId,
    required this.vertexId,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(isVertexSelectedProvider(tripId, vertexId));
    final waypoint = ref.watch(waypointFromVertexProvider(vertexId));

    // L'apparence correspond au waypoint
    return SelectedWidget(
      isSelected: selected,
      child: Builder(
        builder: (context) {
          if (waypoint == null) {
            return Icon(
              Icons.circle,
              size: selected ? 30 : 20,
              color: selected ? Colors.red : Colors.black,
            );
          }

          return CircleAvatar(
            radius: 15,
            backgroundColor: Color(waypoint.poiCategoryUi.colorValue),
            child: Icon(
              waypoint.poiCategoryUi.icon,
              color: Colors.white,
              size: 12,
            ),
          );
        },
      ),
    );
  }
}
