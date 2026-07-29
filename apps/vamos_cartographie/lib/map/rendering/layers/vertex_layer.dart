import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import '/map/map.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vertexIds = ref.watch(vertexStoreProvider(tripId)).getIds();

    final List<Marker> listMarkers = [];
    for (final vertexId in vertexIds) {
      final vertex = ref.watch(vertexProvider(tripId, vertexId));
      listMarkers.add(
        Marker(
          point: vertex.latLng,
          child: VertexMarker(
            tripId: tripId,
            vertexId: vertex.id,
            isDragging: false,
          ),
        ),
      );
    }
    return MarkerLayer(markers: listMarkers);
  }
}
