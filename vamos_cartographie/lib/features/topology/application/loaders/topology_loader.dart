import 'package:vamos_cartographie/features/graph/graph.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/topology/data/topology_providers.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
part "topology_loader.g.dart";

@riverpod
class TopologyLoader extends _$TopologyLoader {
  @override
  Future<void> build(int tripId) async {
    final graph = ref.read(graphStoreProvider);

    final verticesRepo = ref.read(vertexRepositoryProvider);
    final segmentsRepo = ref.read(segmentRepositoryProvider);

    final vertices = await verticesRepo.getVertices(tripId);
    final segments = await segmentsRepo.getSegments(tripId);

    vertices.fold((f) => throw f, (items) {
      for (final v in items) {
        graph.upsert<Vertex>(v);
      }
    });

    segments.fold((f) => throw f, (items) {
      for (final s in items) {
        graph.upsert<Segment>(s);
      }
    });
  }
}
