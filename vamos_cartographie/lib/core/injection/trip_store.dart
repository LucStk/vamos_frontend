import "dart:async";

import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/domain/domain.dart";
import "package:trip_domain/runtime/store/trip_store.dart";
import "package:vamos_cartographie/core/injection/observable_node_impl.dart";
part "trip_store.g.dart";

@riverpod
TripStore rawTripStore(Ref ref) {
  return TripStore(ObservableNodeImpl());
}

@riverpod
Stream<Map<TripId, Trip>> tripStore(Ref ref) {
  final store = ref.watch(rawTripStoreProvider);
  final controller = StreamController<Map<TripId, Trip>>();

  void listener() => controller.add(Map.unmodifiable(store.store));

  store.observableNode.addListener(listener);

  ref.onDispose(() {
    store.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}

@riverpod
Trip? trip(Ref ref, TripId tripId) {
  final asyncTrips = ref.watch(tripStoreProvider);
  return asyncTrips.value?[tripId];
}
