import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/rendering/providers/topology_ui_provider.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:vamos_cartographie/vamos_cartographie.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;

  const VertexLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertices = ref.watch(topologyVerticesProvider(tripId));

    final ctrl = ref.read(mapCtrlProvider(tripId).notifier);

    final markers = vertices.map((vertex) {
      return DragMarker(
        point: vertex.latLng,
        size: const Size(32, 32),
        builder: (_, LatLng latLng, isDragging) => GestureDetector(
          onTap: () => ctrl.onUiEvent(vertex.tapEvent()),
          onDoubleTap: () => ctrl.onUiEvent(vertex.doubleTapEvent()),
          child: vertex.buildMarker(tripId, isDragging),
        ),
        onDragStart: (_, LatLng latLng) =>
            ctrl.onUiEvent(vertex.dragStartEvent()),
        onDragEnd: (_, LatLng latLng) => ctrl.onUiEvent(vertex.dragEndEvent()),
      );
    }).toList();

    return DragMarkers(markers: markers);
  }
}
