import 'graph_store.dart';
import 'package:trip_application/topology/domain/repositories/repositories.dart';

class TopologyQueryHandler {
  final GraphStore graphStore;
  final TopologyRepository repo;
  TopologyQueryHandler(this.graphStore, this.repo);

  // Future<Failure?> loadTopology(TripId tripId) async {
  //   return executor
  //       .run(
  //         onApply: () {},
  //         remote: () => repo.getTopology(tripId),
  //         onSuccess: (data) {
  //           for (final v in data.vertices) {
  //             graphStore.insertVertex(v);
  //           }
  //           for (final s in data.segments) {
  //             graphStore.insertSegment(s);
  //           }
  //         },
  //         onError: (Failure failure) {},
  //       )
  //       .then((data) => data.fold((Failure f) => f, (data) => null));
  // }
}
