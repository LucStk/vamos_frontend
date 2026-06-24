import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/trip_domain.dart";
import "package:vamos_cartographie/core/injection/services/add_listener_to_observable.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
import "package:vamos_cartographie/infrastructure/trip/data.dart";
part "trip_store.g.dart";

@riverpod
TripRemoteDatasource tripRemoteDatasource(Ref ref) {
  return TripRemoteDatasource(ref.watch(clientProvider));
}

@riverpod
TripRepository tripRepository(Ref ref) {
  return TripRepositoryImpl(ref.watch(tripRemoteDatasourceProvider));
}

@riverpod
ObservableTripStore rawTripStore(Ref ref) {
  return ObservableTripStore();
}

@riverpod
ObservableTripStore tripStore(Ref ref) {
  final store = ref.watch(rawTripStoreProvider);
  addListenerRebuild(ref, store);
  return store;
}
