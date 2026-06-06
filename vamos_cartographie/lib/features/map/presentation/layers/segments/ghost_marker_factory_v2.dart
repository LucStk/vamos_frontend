import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/features/map/application/providers/segment_vertices_notifier.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'markers/segment_ghost_marker_view.dart';

/// Construit les ghost markers pour un segment
List<Marker> buildGhostMarkersV2(
  WidgetRef ref,
  BuildContext context,
  int tripId,
  int segmentId,
) {
  final ghosts = ref.watch(segmentGhostMarkersProvider(tripId, segmentId));
  final type = ref.watch(
    segmentProvider(tripId, segmentId).select((s) => s?.type),
  );

  if (ghosts == null || type == null) return [];

  return ghosts.map((ghost) {
    return Marker(
      point: ghost.position,
      width: 20,
      height: 20,
      alignment: Alignment.center,
      child: Draggable<GhostMarkerData>(
        data: ghost,
        feedback: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: 20,
            height: 20,
            child: Container(
              decoration: BoxDecoration(
                color: type.color.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: type.color.withOpacity(0.8),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        childWhenDragging: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: type.color.withOpacity(0.1),
            border: Border.all(color: type.color.withOpacity(0.3), width: 1),
          ),
        ),
        onDragEnd: (details) {
          // Le drag sera géré par un DragTarget global sur la map
        },
        child: GhostMarkerView(type: type),
      ),
    );
  }).toList();
}
