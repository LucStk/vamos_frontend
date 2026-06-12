import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/query_selectors.dart';

import 'package:vamos_cartographie/features/map/presentation/widgets/markers/vertex_marker_view.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/markers/waypoint_marker_view.dart';

import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';

class VertexLayer extends AbstractLayer {
  const VertexLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ─────────────────────────────────────────────
    /// 1. STRUCTURE ONLY (ajout / suppression vertices)
    /// ─────────────────────────────────────────────
    final vertices = ref.watch(collectionProvider<Vertex>());

    /// ─────────────────────────────────────────────
    /// 2. RELATION INDEX (vertexId -> waypoint)
    /// ─────────────────────────────────────────────
    final waypointByVertex = ref.watch(
      indexedByProvider<Waypoint, int>((w) => w.vertexId),
    );

    if (vertices.isEmpty) {
      return const SizedBox.shrink();
    }

    return MarkerLayer(
      markers: [
        for (final vertex in vertices.values)
          buildVertexMarker(
            tripId: tripId,
            vertex: vertex,
            waypoint: waypointByVertex[vertex.id]?[0],
          ),
      ],
    );
  }
}

Marker buildVertexMarker({
  required int tripId,
  required Vertex vertex,
  required Waypoint? waypoint,
}) {
  return Marker(
    point: vertex.latLng,
    width: 30,
    height: 30,
    child: waypoint == null
        ? const VertexMarkerView()
        : WaypointMarkerView(waypointId: waypoint.id),
  );
}
