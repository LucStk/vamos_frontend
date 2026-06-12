import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/topology/data/providers/segments_providers.dart';
import 'package:vamos_cartographie/features/topology/data/providers/vertex_providers.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import 'package:vamos_cartographie/features/waypoints/data/providers/waypoints_providers.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
part "graph_loader.g.dart";

@riverpod
class GraphLoader extends _$GraphLoader {
  @override
  Future<void> build(int tripId) async {
    final graph = ref.read(graphStoreProvider);

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
}
