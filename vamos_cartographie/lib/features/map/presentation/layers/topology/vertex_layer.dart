import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/waypoint_marker_view.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/vertex_marker_view.dart';

import 'package:vamos_cartographie/features/waypoints/waypoints.dart';

class VertexLayer extends AbstractLayer {
  const VertexLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertices = ref.watch(vertexMapProvider(tripId));
    final waypointByVertex = ref.watch(waypointsByVertexProvider(tripId));

    if (vertices.isEmpty) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        for (final vertex in vertices.values)
          Marker(
            point: vertex.latLng,
            width: 30,
            height: 30,
            child: Builder(
              builder: (context) {
                final Waypoint? waypoint = waypointByVertex[vertex.id];
                if (waypoint == null) return VertexMarkerView();
                return WaypointMarkerView(
                  waypointId: waypoint.id,
                  tripId: tripId,
                  type: waypoint.type,
                );
              },
            ),
          ),
      ],
    );
  }
}
