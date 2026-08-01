import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_application/hit_engine/hit_model.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import '/map/map.dart';

class VertexLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const VertexLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hitNotifier = ref.watch(hitLayerProvider);
    final vertexIds = ref.watch(vertexStoreProvider(tripId)).getIds();

    final hitCircles = <CircleMarker<MapHit>>[];
    final markers = <Marker>[];

    for (final id in vertexIds) {
      final vertex = ref.watch(vertexProvider(tripId, id));

      // Zone de hit invisible, large — uniquement pour le hit-test
      hitCircles.add(
        CircleMarker<MapHit>(
          point: vertex.latLng,
          radius: 24,
          color: const Color(0x00000000),
          hitValue: VertexHit(vertex),
        ),
      );

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

    return Stack(
      children: [
        CircleLayer<MapHit>(hitNotifier: hitNotifier, circles: hitCircles),
        MarkerLayer(markers: markers),
      ],
    );
  }
}
