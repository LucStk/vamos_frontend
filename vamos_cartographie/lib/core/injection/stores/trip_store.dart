import "dart:async";

import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/application/repositories/trip_repository.dart";
import "package:trip_domain/domain/domain.dart";
import "package:trip_domain/runtime/store/trip_store.dart";
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
TripStore rawTripStore(Ref ref) {
  return TripStore(ObservableNodeImpl());
}

@riverpod
Stream<Map<TripId, Trip>> tripStore(Ref ref) {
  final store = ref.watch(rawTripStoreProvider);
  final controller = StreamController<Map<TripId, Trip>>();
  controller.add(Map.unmodifiable(store.store));
  void listener() => controller.add(Map.unmodifiable(store.store));

  store.observableNode.addListener(listener);

  ref.onDispose(() {
    store.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}
