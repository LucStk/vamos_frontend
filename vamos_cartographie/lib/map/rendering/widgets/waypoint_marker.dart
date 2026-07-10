import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/waypoint/presentation/poi_ui.dart';

class WaypointMarker extends ConsumerWidget {
  final TripId tripId;
  final VertexRef vertexRef;
  final Waypoint waypoint;
  final bool isDragging;
  const WaypointMarker({
    super.key,
    required this.tripId,
    required this.waypoint,
    required this.vertexRef,
    required this.isDragging,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(isVertexSelectedProvider(tripId, vertexRef));

    return AnimatedScale(
      scale: selected ? 1.5 : 1.0,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOutBack,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: selected ? 2 : 0),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Color(waypoint.poiCategoryUi.colorValue),
          child: Icon(
            waypoint.poiCategoryUi.icon,
            color: Colors.white,
            size: 12,
          ),
        ),
      ),
    );
  }
}
