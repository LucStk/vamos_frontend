import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'waypoint_store.dart';

import '/core/injection/optimistic_executor_provider.dart';
part 'waypoint_handler.g.dart';

@riverpod
WaypointHandler waypointHandler(Ref ref, TripId tripId) {
  // On lit les RAW stores (instances stables qui ne déclencheront aucun rebuild)
  final store = ref.read(rawWaypointStoreProvider);
  final graphStore = ref.read(rawGraphStoreProvider);
  final repo = ref.read(waypointRepositoryProvider);
  final executor = ref.read(optimisticExecutorProvider);

  return WaypointHandler(tripId, store, graphStore, repo, executor);
}
