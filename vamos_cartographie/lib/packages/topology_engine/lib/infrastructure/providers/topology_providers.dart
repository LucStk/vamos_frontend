import "package:flutter/rendering.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:vamos_cartographie/core/type/id.dart";
import "package:vamos_cartographie/features/features.dart";
import "package:topology_engine/runtime/store/graph_store.dart";
import "package:topology_engine/application/pipeline/graph_executor.dart";
import "package:topology_engine/data/providers/segments_providers.dart";
import "package:topology_engine/data/providers/vertex_providers.dart";
import "package:vamos_cartographie/features/waypoints/data/providers/waypoints_providers.dart";
part "topology_providers.g.dart";

@riverpod
class TripGraph extends _$TripGraph {
  @override
  Future<GraphStore> build(Id<Trip> tripId) async {
    // 1. On crée une instance neuve à chaque fois que le cycle de vie du provider redémarre
    final graph = GraphStore();
    graph.clear();
    debugPrint("\nrebuild trip\n");
    // 2. On charge les données du backend
    final verticesRepo = ref.watch(vertexRepositoryProvider);
    final segmentsRepo = ref.watch(segmentRepositoryProvider);
    final waypointsRepo = ref.watch(waypointRepositoryProvider);

    final verticesResult = await verticesRepo.getVertices(tripId);
    final segmentsResult = await segmentsRepo.getSegments(tripId);
    final waypointsResult = await waypointsRepo.getWaypoints(tripId);

    // 3. Remplissage du store tout neuf
    verticesResult.fold((f) => throw Exception(f.message), (items) {
      items.forEach(graph.seed<Vertex>);
    });
    segmentsResult.fold(
      (f) => throw Exception(f.message),
      (items) => items.forEach(graph.seed<Segment>),
    );
    waypointsResult.fold((f) => throw Exception(f.message), (items) {
      items.forEach(graph.seed<Waypoint>);
    });

    return graph;
  }
}

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  return OptimisticExecutor();
}
