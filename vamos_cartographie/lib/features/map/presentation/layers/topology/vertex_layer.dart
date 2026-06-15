import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';

import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/query_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';

import 'package:vamos_cartographie/features/topology/orchestrators/vertex_orchestrator.dart';

import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/abstract_layer.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";

class VertexLayer extends AbstractLayer {
  const VertexLayer({super.key, required super.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ─────────────────────────────────────────────
    /// 1. STRUCTURE ONLY (ajout / suppression vertices)
    /// ─────────────────────────────────────────────
    final vertices = ref.watch(collectionProvider<Vertex>(tripId));

    /// ─────────────────────────────────────────────
    /// 2. RELATION INDEX (vertexId -> waypoint)
    /// ─────────────────────────────────────────────
    final waypointByVertex = ref.watch(
      indexedByProvider<Waypoint, Id<Vertex>>(tripId, (w) => w.vertexId),
    );
    final VertexOrchestrator vertexOrchestrator = ref.watch(
      vertexOrchestratorProvider(tripId).notifier,
    );
    if (vertices.isEmpty) {
      return const SizedBox.shrink();
    }

    return DragMarkers(
      markers: [
        for (final vertex in vertices.values)
          buildVertexMarker(
            tripId: tripId,
            vertex: vertex,
            waypoint: waypointByVertex[vertex.id]?[0],
            onDragEnd: (vertexId, laLng) =>
                vertexOrchestrator.moveVertex(vertexId, laLng),
          ),
      ],
    );
  }
}

DragMarker buildVertexMarker({
  required Id<Trip> tripId,
  required Vertex vertex,
  required Waypoint? waypoint,
  required void Function(Id<Vertex>, LatLng) onDragEnd,
}) {
  return DragMarker(
    point: vertex.latLng,
    size: Size(32, 32),
    builder: (BuildContext context, LatLng latLng, bool isDragging) {
      late MapMarker marker;
      late PopMenu popMenu;
      if (waypoint != null) {
        marker = WaypointMarker(waypointId: waypoint.id, tripId: tripId);
        popMenu = WaypointMenu(tripId: tripId);
      } else {
        marker = VertexMarker(tripId: tripId, vertexId: vertex.id);
        popMenu = VertexMenu(tripId: tripId);
      }
      final controller = OverlayPortalController();
      return MarkerWtMenuShell(
        isDragging: isDragging,
        popMenu: popMenu,
        marker: marker,
        controller: controller,
      );
    },
    onDragEnd: (details, latLng) => onDragEnd(vertex.id, latLng),
  );
}
