import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';

import '/core/injection/optimistic_executor_provider.dart';
import '/core/injection/stores/waypoint_store.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/waypoint_remote_datasource.dart';
part 'waypoint_provider.g.dart';

@riverpod
WaypointHandler waypointHandler(Ref ref, TripId tripId) {
  final store = ref.watch(rawWaypointStoreProvider);
  final repo = ref.watch(waypointRepositoryProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  return WaypointHandler(tripId, store, repo, executor);
}
