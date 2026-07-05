import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

class TopologyQueryHandler {
  final GraphStore graphStore;
  final TopologyRepository
  repo; // ou VertexRepository/SegmentRepository combinés

  TopologyQueryHandler(this.graphStore, this.repo);

  Future<Either<Failure, void>> loadTopology(TripId tripId) async {
    final result = await repo.getTopology(tripId);
    return result.map((topology) {
      for (final v in topology.vertices) {
        graphStore.insertVertex(v);
      }
      for (final s in topology.segments) {
        graphStore.insertSegment(s);
      }
    });
  }
}
