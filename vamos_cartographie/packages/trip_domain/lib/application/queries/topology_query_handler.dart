import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

class TopologyQueryHandler {
  final GraphStore graphStore;
  final TopologyRepository repo;
  final ErrorLogger? errorLogger;
  TopologyQueryHandler(this.graphStore, this.repo, this.errorLogger);

  Future<Failure?> loadTopology(TripId tripId) async {
    final result = await repo.getTopology(tripId);
    return result.fold(
      (Failure f) {
        return f;
      },
      (data) {
        print("result loadTopology ${data.vertices} ${data.segments}");
        for (final v in data.vertices) {
          graphStore.insertVertex(v);
        }
        for (final s in data.segments) {
          graphStore.insertSegment(s);
        }
        return null;
      },
    );
  }
}
