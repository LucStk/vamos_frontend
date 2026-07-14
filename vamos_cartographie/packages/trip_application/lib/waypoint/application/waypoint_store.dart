import 'package:trip_application/trip_application.dart';

class WaypointStore {
  final GraphCollectionStore<Waypoint> waypointStore;
  Map<VertexId, WaypointId> vertexIndex;

  WaypointStore({required this.waypointStore, required this.vertexIndex});

  WaypointStore.initial()
    : vertexIndex = {},
      waypointStore = const GraphCollectionStore();

  WaypointStore copyWith({GraphCollectionStore<Waypoint>? waypointStore}) {
    return WaypointStore(
      vertexIndex: vertexIndex, // toujours la même instance
      waypointStore: waypointStore ?? this.waypointStore,
    );
  }
}

extension WaypointStoreActions on WaypointStore {
  WaypointStore upsertWaypoint(Waypoint waypoint) {
    vertexIndex[waypoint.vertexId] = waypoint.id;
    return copyWith(
      waypointStore: waypointStore.upsertState(
        NodeState<Waypoint>.patchEntity(waypoint),
      ),
    );
  }

  WaypointStore removeWaypoint(WaypointId id) {
    // on supprime le vertexId associé
    final vertexId = waypointStore.get(id)?.current.displayValue.vertexId;
    vertexIndex.remove(vertexId);
    return copyWith(waypointStore: waypointStore.remove(id));
  }

  void commitWaypoint(Waypoint serverWaypoint) {
    waypointStore.get(serverWaypoint.id)?.commit(serverWaypoint);
  }

  void rollbackWaypoint(WaypointId wid) => waypointStore.get(wid)?.rollback();

  WaypointStore clear() {
    vertexIndex = {};
    return copyWith(waypointStore: GraphCollectionStore<Waypoint>());
  }
}

extension WaypointStoreGetters on WaypointStore {
  WaypointId? getFromVertex(VertexId vertexId) {
    return vertexIndex[vertexId];
  }
}
