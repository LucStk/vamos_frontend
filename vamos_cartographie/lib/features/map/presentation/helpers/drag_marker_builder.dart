import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/map/application/providers/pop_up_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";

DragMarker buildDragMarker({
  required WidgetRef ref,
  required Id<Trip> tripId,
  required Id<Vertex> vertexId,
  required AbstractMarker Function(LatLng, bool) markerBuilder,
}) {
  final VertexOrchestrator vertexOrchestrator = ref.watch(
    vertexOrchestratorProvider(tripId).notifier,
  );
  final vertex = ref.watch(nodeRequiredProvider<Vertex>(tripId, vertexId));
  final popUp = ref.watch(mapPopupProvider(tripId).notifier);
  return DragMarker(
    point: vertex.latLng,
    size: Size(32, 32),
    builder: (_, LatLng latLng, bool isDragging) =>
        markerBuilder(latLng, isDragging),
    onDragStart: (_, _) => {popUp.hide()},
    onDragEnd: (details, latLng) =>
        vertexOrchestrator.moveVertex(vertexId, latLng),
  );
}
