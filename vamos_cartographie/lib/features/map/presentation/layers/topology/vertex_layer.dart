import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/drag_marker_builder.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";

class VertexLayer extends AbstractLayer {
  const VertexLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertexIds = ref.watch(getIdsProvider<Vertex>(tripId));
    final waypoints = ref.watch(collectionProvider<Waypoint>(tripId));

    final waypointsVertex = Map.fromEntries(
      waypoints.entries.map(
        (entry) => MapEntry(entry.key, entry.value.vertexId),
      ),
    );
    // On trouve les vertex qui ne sont pas associé à un waypoint.
    final simplesVertex = vertexIds.toSet().difference(
      waypointsVertex.keys.toSet(),
    );

    if (simplesVertex.isEmpty && waypointsVertex.isEmpty) {
      return const SizedBox.shrink();
    }

    return DragMarkers(
      markers: [
        for (final vertexId in simplesVertex)
          buildDragMarker(
            ref: ref,
            tripId: tripId,
            vertexId: vertexId,
            markerBuilder: (latLng, isDragging) {
              return VertexMarker(
                tripId: tripId,
                vertexId: vertexId,
                isDragging: isDragging,
              );
            },
          ),
        for (final v in waypointsVertex.entries)
          buildDragMarker(
            ref: ref,
            tripId: tripId,
            vertexId: v.value,
            markerBuilder: (latLng, isDragging) {
              return WaypointMarker(
                tripId: tripId,
                waypointId: v.key,
                isDragging: isDragging,
              );
            },
          ),
      ],
    );
  }
}
