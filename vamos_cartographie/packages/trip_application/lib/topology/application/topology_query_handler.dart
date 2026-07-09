import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import 'package:trip_application/topology/domain/repositories/repositories.dart';
import 'package:trip_application/topology/runtime/runtime.dart';
import 'package:trip_application/trip/domain/trip.dart';

class TopologyQueryHandler {
  final GraphStore graphStore;
  final TopologyRepository repo;
  final OptimisticExecutor executor;
  TopologyQueryHandler(this.graphStore, this.repo, this.executor);

  Future<Failure?> loadTopology(TripId tripId) async {
    return executor
        .run(
          onApply: () {},
          remote: () => repo.getTopology(tripId),
          onSuccess: (data) {
            for (final v in data.vertices) {
              graphStore.insertVertex(v);
            }
            for (final s in data.segments) {
              graphStore.insertSegment(s);
            }
          },
          onError: (Failure failure) {},
        )
        .then((data) => data.fold((Failure f) => f, (data) => null));
  }
}
