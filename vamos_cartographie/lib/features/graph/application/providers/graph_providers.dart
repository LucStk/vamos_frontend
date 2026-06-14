import "package:flutter/rendering.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:vamos_cartographie/core/type/id.dart";
import "package:vamos_cartographie/features/features.dart";
import "package:vamos_cartographie/features/graph/graph.dart";
import "package:vamos_cartographie/features/graph/store/graph_store.dart";
import "package:vamos_cartographie/features/topology/data/providers/segments_providers.dart";
import "package:vamos_cartographie/features/topology/data/providers/vertex_providers.dart";
import "package:vamos_cartographie/features/waypoints/data/providers/waypoints_providers.dart";
part "graph_providers.g.dart";

// @riverpod
// GraphStore graphStore(Ref ref, Id<Trip> tripId) {
//   return GraphStore();
// }

// Future<void> graphLoader(Ref ref, GraphStore graph, Id<Trip> tripId) async {
//   final verticesRepo = ref.read(vertexRepositoryProvider);
//   final segmentsRepo = ref.read(segmentRepositoryProvider);
//   final waypointsRepo = ref.read(waypointRepositoryProvider);

//   final verticesResult = await verticesRepo.getVertices(tripId);
//   final segmentsResult = await segmentsRepo.getSegments(tripId);
//   final waypointsResult = await waypointsRepo.getWaypoints(tripId);

//   verticesResult.fold((f) => throw Exception(f.message), (items) {
//     for (final v in items) {
//       graph.seed<Vertex>(v);
//     }
//   });
//   segmentsResult.fold((f) => throw Exception(f.message), (items) {
//     for (final s in items) {
//       graph.seed<Segment>(s);
//     }
//   });
//   waypointsResult.fold((f) => throw Exception(f.message), (items) {
//     for (final w in items) {
//       graph.seed<Waypoint>(w);
//     }
//   });
// }

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
      debugPrint("Vertices loadé ${items.map((v) => v.id)}");
    });
    segmentsResult.fold(
      (f) => throw Exception(f.message),
      (items) => items.forEach(graph.seed<Segment>),
    );
    waypointsResult.fold((f) => throw Exception(f.message), (items) {
      items.forEach(graph.seed<Waypoint>);
      debugPrint("Waypoints loadé ${items.map((v) => v.id)}");
    });

    return graph;
  }
}

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  return OptimisticExecutor();
}
