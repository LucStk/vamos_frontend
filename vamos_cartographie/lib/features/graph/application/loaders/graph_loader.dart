import 'package:vamos_cartographie/features/graph/core/node.dart';
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

    final vertices = await verticesRepo.getVertices(tripId);
    final segments = await segmentsRepo.getSegments(tripId);
    final waypoints = await waypointsRepo.getWaypoints(tripId);

    vertices.fold((f) => throw f, (items) {
      for (final v in items) {
        graph.map<Vertex>()[v.id] = Node(v);
      }
    });
    segments.fold((f) => throw f, (items) {
      for (final s in items) {
        graph.map<Segment>()[s.id] = Node(s);
      }
    });
    waypoints.fold((f) => throw f, (items) {
      for (final w in items) {
        graph.map<Waypoint>()[w.id] = Node(w);
      }
    });
  }
}
