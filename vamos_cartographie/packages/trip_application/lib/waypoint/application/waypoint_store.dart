import 'package:domain_core/domain/domain.dart';
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
  WaypointStore insertWaypoint(Waypoint waypoint) {
    vertexIndex[waypoint.vertexId] = waypoint.id;
    return copyWith(
      waypointStore: waypointStore.insertState(
        NodeState<Waypoint>.hasPatch(
          patch: waypoint.createPatch(),
          originalValue: waypoint,
        ),
      ),
    );
  }

  WaypointStore removeWaypoint(WaypointId id) {
    // on supprime le vertexId associé
    final wState = waypointStore.getState(id)?.serverValue;
    final vertexId = wState?.vertexId;
    vertexIndex.remove(vertexId);
    return copyWith(waypointStore: waypointStore.remove(id));
  }

  void setWaypoint(Waypoint serverWaypoint) {
    waypointStore.get(serverWaypoint.id)?.set(serverWaypoint);
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
