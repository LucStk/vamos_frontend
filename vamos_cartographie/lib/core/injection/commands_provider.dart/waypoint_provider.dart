import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/application/commands/commands.dart';
import 'package:trip_domain/application/repositories/trip_repository.dart';
import 'package:trip_domain/trip_domain.dart';

import "package:vamos_cartographie/core/injection/client_provider.dart";
import 'package:vamos_cartographie/core/injection/optimistic_executor_provider.dart';
import 'package:vamos_cartographie/core/injection/trip_store.dart';
import 'package:vamos_cartographie/core/injection/waypoint_store.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/waypoint_remote_datasource.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/waypoint_repository_impl.dart';
part 'waypoint_provider.g.dart';

@riverpod
WaypointRemoteDatasource waypointRemoteDatasource(Ref ref) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
WaypointRepository waypointRepository(Ref ref) {
  return WaypointRepositoryImpl(ref.watch(waypointRemoteDatasourceProvider));
}

@riverpod
WaypointHandler waypointHandler(Ref ref, TripId tripId) {
  final store = ref.watch(rawWaypointStoreProvider);
  final repo = ref.watch(waypointRepositoryProvider);
  final executor = ref.watch(optimisticExecutorProvider);
  return WaypointHandler(tripId, store, repo, executor);
}
