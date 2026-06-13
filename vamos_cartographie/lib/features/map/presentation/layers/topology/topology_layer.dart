import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/topology/vertex_layer.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import "segment_layer.dart";
import "segment_type_marker_layer.dart";

class TopologyLayer extends ConsumerWidget {
  // 1. On hérite de ConsumerWidget
  final Id<Trip>
  tripId; // Récupéré de ton besoin initial (ou via super si AbstractLayer le stocke)

  const TopologyLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. La méthode build est synchrone

    // 3. On "watch" le provider asynchrone en lui passant l'ID
    final tripGraphAsync = ref.watch(tripGraphProvider(tripId));

    // 4. On utilise .when pour gérer le cycle de vie asynchrone
    return tripGraphAsync.when(
      loading: () => const Center(
        child:
            CircularProgressIndicator(), // Écran de chargement pendant que le loader tourne
      ),
      error: (err, stack) => Center(
        child: Text(
          'Erreur lors du chargement du graphe : $err',
        ), // Gestion des erreurs (.fold de tes repos)
      ),
      data: (graphStore) {
        // Le graphe est chargé et prêt ! On affiche les sous-layers
        return Stack(
          children: [
            SegmentLayer(tripId: tripId),
            SegmentTypeMarkerLayer(tripId: tripId),
            VertexLayer(tripId: tripId),
          ],
        );
      },
    );
  }
}
