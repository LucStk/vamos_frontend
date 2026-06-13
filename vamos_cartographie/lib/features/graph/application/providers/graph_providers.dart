import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:vamos_cartographie/core/type/id.dart";
import "package:vamos_cartographie/features/features.dart";
import "package:vamos_cartographie/features/graph/graph.dart";
import "package:vamos_cartographie/features/graph/store/graph_store.dart";
import "package:vamos_cartographie/features/topology/data/providers/segments_providers.dart";
import "package:vamos_cartographie/features/topology/data/providers/vertex_providers.dart";
import "package:vamos_cartographie/features/waypoints/data/providers/waypoints_providers.dart";
part "graph_providers.g.dart";

@riverpod
GraphStore graphStore(Ref ref, Id<Trip> tripId) {
  return GraphStore();
}

@riverpod
Future<void> graphLoader(Ref ref, Id<Trip> tripId) async {
  final graph = ref.read(graphStoreProvider(tripId));

  final verticesRepo = ref.read(vertexRepositoryProvider);
  final segmentsRepo = ref.read(segmentRepositoryProvider);
  final waypointsRepo = ref.read(waypointRepositoryProvider);

  final verticesResult = await verticesRepo.getVertices(tripId);
  final segmentsResult = await segmentsRepo.getSegments(tripId);
  final waypointsResult = await waypointsRepo.getWaypoints(tripId);

  verticesResult.fold((f) => throw Exception(f.message), (items) {
    for (final v in items) {
      graph.seed<Vertex>(v);
    }
  });
  segmentsResult.fold((f) => throw Exception(f.message), (items) {
    for (final s in items) {
      graph.seed<Segment>(s);
    }
  });
  waypointsResult.fold((f) => throw Exception(f.message), (items) {
    for (final w in items) {
      graph.seed<Waypoint>(w);
    }
  });
}

@riverpod
OptimisticExecutor optimisticExecutor(Ref ref) {
  return OptimisticExecutor();
}
