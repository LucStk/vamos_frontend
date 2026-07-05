import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/runtime/store/segment_store.dart';
import 'package:trip_domain/runtime/store/vertex_store.dart';
import 'package:trip_domain/trip_domain.dart';

class TopologyQueryHandler {
  final VertexStore vertexStore; // ou observable si tu en as un
  final SegmentStore segmentStore;
  final TopologyRepository
  repo; // ou VertexRepository/SegmentRepository combinés

  TopologyQueryHandler(this.vertexStore, this.segmentStore, this.repo);

  Future<Either<Failure, void>> loadTopology(TripId tripId) async {
    final result = await repo.getTopology(tripId);
    return result.map((topology) {
      for (final v in topology.vertices) {
        vertexStore.insert(v);
      }
      for (final s in topology.segments) {
        segmentStore.insert(s);
      }
    });
  }
}
