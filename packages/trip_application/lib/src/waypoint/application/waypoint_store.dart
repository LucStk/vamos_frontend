import 'package:domain_core/domain/domain.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';

class WaypointStore {
  final GraphCollectionStore<WaypointFields> waypointStore;

  WaypointStore({required this.waypointStore});

  WaypointStore.initial() : waypointStore = const GraphCollectionStore();

  WaypointStore copyWith({
    GraphCollectionStore<WaypointFields>? waypointStore,
  }) {
    return WaypointStore(waypointStore: waypointStore ?? this.waypointStore);
  }
}

extension WaypointStoreActions on WaypointStore {
  WaypointStore insertWaypoint(WaypointFields state) {
    return copyWith(waypointStore: waypointStore.insertState(state));
  }

  WaypointStore removeWaypoint(WaypointId id) {
    // on supprime le vertexId associé
    return copyWith(waypointStore: waypointStore.remove(id));
  }

  WaypointStore setWaypoint(WaypointFields serverWaypoint) {
    return copyWith(waypointStore: waypointStore.setNode(serverWaypoint));
  }

  WaypointStore rollbackWaypoint(WaypointId wid) =>
      copyWith(waypointStore: waypointStore.rollbackNode(wid));

  WaypointStore clear() {
    return copyWith(waypointStore: GraphCollectionStore<WaypointFields>());
  }
}
