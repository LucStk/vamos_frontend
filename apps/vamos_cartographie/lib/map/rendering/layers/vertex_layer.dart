import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import '/map/map.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mapStateProvider(tripId).notifier);
    final mapMode = ref.watch(mapStateProvider(tripId).select((s) => s.mode));
    final vertexIds = ref.watch(vertexStoreProvider(tripId)).getIds();

    final isSketchMode = mapMode is Sketch;

    const totalSize = 26.0;
    final List<DragMarker> listDragMarkers = [];
    for (final vertexId in vertexIds) {
      final vertex = ref.watch(vertexProvider(tripId, vertexId));

      listDragMarkers.add(
        DragMarker(
          point: vertex.latLng,
          size: const Size(totalSize, totalSize),
          disableDrag: isSketchMode, // 👈
          builder: (context, LatLng latLng, isDragging) {
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => notifier.sendUiEvent(VertexTapped(vertex)),
                  child: VertexMarker(
                    tripId: tripId,
                    vertexId: vertex.id,
                    isDragging: isDragging,
                  ),
                ),
              ],
            );
          },
          onDragStart: (_, LatLng latLng) =>
              notifier.sendUiEvent(VertexDragStarted(vertex.id)),
          onDragEnd: (_, LatLng latLng) =>
              notifier.sendUiEvent(VertexDragEnd(vertex.id, latLng)),
        ),
      );
    }
    return DragMarkers(markers: listDragMarkers);
  }
}
