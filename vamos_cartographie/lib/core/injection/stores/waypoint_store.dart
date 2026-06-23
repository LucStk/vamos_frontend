import "dart:async";

import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_domain/domain/domain.dart";
import "package:trip_domain/runtime/store/waypoint_store.dart";
import "package:vamos_cartographie/core/injection/observable_node_impl.dart";
part "waypoint_store.g.dart";

@riverpod
WaypointStore rawWaypointStore(Ref ref) {
  return WaypointStore(ObservableNodeImpl());
}

@riverpod
Stream<Map<WaypointId, Waypoint>> waypointStore(Ref ref) {
  final store = ref.watch(rawWaypointStoreProvider);
  final controller = StreamController<Map<WaypointId, Waypoint>>();

  void listener() => controller.add(Map.unmodifiable(store.store));

  store.observableNode.addListener(listener);

  ref.onDispose(() {
    store.observableNode.removeListener(listener);
    controller.close();
  });

  return controller.stream;
}

@riverpod
Waypoint? waypoint(Ref ref, WaypointId id) {
  final asyncTrips = ref.watch(waypointStoreProvider);
  return asyncTrips.value?[id];
}
