import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/map/canvas/layers/markers/vertex_marker.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertexIds = ref.watch(vertexStoreProvider(tripId)).getIds();
    final markers = <Marker>[];

    for (final id in vertexIds) {
      final vertex = ref.watch(vertexProvider(tripId, id));

      // Rendu visuel réel, riche (widget Riverpod)
      markers.add(
        Marker(
          point: vertex.latLng,
          width: 30,
          height: 30,
          child: VertexMarker(tripId: tripId, vertexId: id, isDragging: false),
        ),
      );
    }

    return Stack(children: [MarkerLayer(markers: markers)]);
  }
}
