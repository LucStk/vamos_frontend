import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
part 'graph_queries.g.dart';

@riverpod
TopologyQueryHandler topologyQueryHandler(Ref ref) {
  final graphStore = ref.read(rawGraphStoreProvider);
  final repo = ref.read(topologyRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);
  return TopologyQueryHandler(graphStore, repo, executor);
}

@riverpod
Future<void> loadTopology(Ref ref, TripId tripId) async {
  final handler = ref.watch(topologyQueryHandlerProvider);
  await handler.loadTopology(tripId);
}
