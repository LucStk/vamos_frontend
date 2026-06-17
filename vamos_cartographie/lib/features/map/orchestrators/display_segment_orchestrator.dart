import 'package:flutter/rendering.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/topology/orchestrators/segment_orchestrator.dart';

part 'display_segment_orchestrator.g.dart';

@Riverpod(keepAlive: true)
class DisplaySegmentOrchestrator extends _$DisplaySegmentOrchestrator {
  @override
  Id<Vertex>? build(Id<Trip> tripId) {
    return null; // C'est l'état initial
  }

  SegmentOrchestrator get segmentOrchestrator =>
      ref.read(segmentOrchestratorProvider(tripId).notifier);

  void startWaypoint(Id<Vertex> vertexId) {
    state = vertexId;
    debugPrint("startVertex posé sur $state");
  }

  bool isCreating() {
    return state != null;
  }

  List<LatLng> createOptimiticGeometry(
    Id<Vertex> startVertexId,
    Id<Vertex> endVertexId,
  ) {
    final Vertex startVertex = ref.read(
      nodeRequiredProvider<Vertex>(tripId, startVertexId),
    );

    final Vertex endVertex = ref.read(
      nodeRequiredProvider<Vertex>(tripId, endVertexId),
    );

    return [startVertex.latLng, endVertex.latLng];
  }

  Future<void> endWaypoint(Id<Vertex> endVertexId) async {
    // 4. On récupère la valeur actuelle de l'état
    final currentStartVertexId = state;

    if (currentStartVertexId == null) {
      throw Exception("No startVertexId defined $state");
    }

    final draft = SegmentDraft(
      startVertexId: currentStartVertexId,
      endVertexId: endVertexId,
    );

    final optimistGeo = createOptimiticGeometry(
      currentStartVertexId,
      endVertexId,
    );

    // Optionnel : réinitialiser l'état après la création
    state = null;

    await segmentOrchestrator.createSegment(draft, optimistGeo);
  }
}
