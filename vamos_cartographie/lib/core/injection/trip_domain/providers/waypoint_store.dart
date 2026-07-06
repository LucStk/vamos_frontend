import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/core/injection/services//add_listener_to_observable.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "/core/infrastructure/waypoint/data.dart";
part "waypoint_store.g.dart";

@riverpod
WaypointRemoteDatasource waypointRemoteDatasource(Ref ref) {
  return WaypointRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
WaypointRepository waypointRepository(Ref ref) {
  return WaypointRepositoryImpl(ref.watch(waypointRemoteDatasourceProvider));
}

@riverpod
ObservableWaypointStore rawWaypointStore(Ref ref) {
  return ObservableWaypointStore();
}

@riverpod
ObservableWaypointStore waypointStore(Ref ref) {
  final store = ref.watch(rawWaypointStoreProvider);
  addListenerRebuild(ref, store);
  return store;
}
