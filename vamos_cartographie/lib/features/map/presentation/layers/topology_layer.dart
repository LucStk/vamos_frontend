import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import "segment_layer.dart";
import "segment_markers_layer.dart";

import 'vertex_layer.dart';

class TopologyLayer extends ConsumerWidget {
  // 1. On hérite de ConsumerWidget
  final Id<Trip> tripId;
  const TopologyLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripGraphAsync = ref.watch(tripGraphProvider(tripId));

    return tripGraphAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          Center(child: Text('Erreur lors du chargement du graphe : $err')),
      data: (graphStore) {
        return Stack(
          children: [
            SegmentLayer(tripId: tripId),
            SegmentMarkersLayer(tripId: tripId),
            VertexLayer(tripId: tripId),
          ],
        );
      },
    );
  }
}
