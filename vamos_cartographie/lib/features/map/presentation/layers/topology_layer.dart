import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import "segment_layer.dart";
import "segment_markers_layer.dart";

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
      data: (graphStore) => _buildLayers(ref),
    );
  }

  Widget _buildLayers(WidgetRef ref) {
    final vertexIds = ref.watch(getIdsProvider<Vertex>(tripId));
    final waypoints = ref.watch(collectionProvider<Waypoint>(tripId));
    final waypointIdsVertexIds = Map.fromEntries(
      waypoints.entries.map(
        (entry) => MapEntry(entry.key, entry.value.vertexId),
      ),
    );
    final cleanVertexIds = vertexIds.toSet().difference(
      waypointIdsVertexIds.values.toSet(),
    );
    return Stack(
      children: [
        SegmentLayer(tripId: tripId),
        SegmentMarkersLayer(tripId: tripId),
        VertexLayer(tripId: tripId),
      ],
    );
  }
}
