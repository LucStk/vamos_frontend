import 'package:trip_domain/domain/domain.dart';

class WaypointStore {
  final Map<WaypointId, Waypoint> store = {};
  final Map<VertexId, WaypointId> vertexIndex = {};

  WaypointStore();

  void clear() => store.clear();

  void upsert(Waypoint waypoint) {
    store[waypoint.id] = waypoint;
    vertexIndex[waypoint.vertexId] = waypoint.id;
  }

  void remove(WaypointId id) {
    Waypoint? waypoint = store.remove(id);
    if (waypoint == null) {
      throw Exception("No id to remove");
    }
    vertexIndex.remove(waypoint.vertexId);
  }
}

extension WaypointStoreGetters on WaypointStore {
  Waypoint? get(WaypointId id) => store[id];
  Waypoint? getFromVertex(VertexId vertexId) {
    final id = vertexIndex[vertexId];
    if (id == null) return null;
    final w = get(id);
    if (w == null) throw Exception("Vertex $vertexId inconsistent");
    return w;
  }

  Waypoint getRequired(WaypointId id) =>
      get(id) ?? (throw Exception("Waypoint $id not found"));
}
