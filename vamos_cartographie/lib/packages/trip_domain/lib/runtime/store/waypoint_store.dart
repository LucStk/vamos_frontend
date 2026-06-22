import 'package:domain_core/domain_core.dart';
import 'package:topology_engine/topology_engine.dart';
import 'package:trip_domain/domain/waypoint.dart';

class WaypointStore {
  final Map<WaypointId, Waypoint> store = {};
  final Map<VertexId, WaypointId> vertexIndex = {};

  final ObservableNode observableNode;
  WaypointStore(this.observableNode);

  void clear() {
    store.clear();
    observableNode.notify();
  }

  Waypoint? get(WaypointId id) => store[id];
  Waypoint? getFromVertex(VertexId vertexId) {
    WaypointId? id = vertexIndex[vertexId];
    if (id == null) return null;
    Waypoint? w = get(id);
    if (w == null) {
      throw Exception(
        "Vertex id $vertexId associated with the waypointId $id, but Waypoint not in store",
      );
    }
    return w;
  }

  Waypoint getRequired(WaypointId id) {
    var r = get(id);
    if (r == null) {
      throw Exception("Waypoint $id not found in store");
    }
    return r;
  }

  void upsert(Waypoint waypoint) {
    store[waypoint.id] = waypoint;
    vertexIndex[waypoint.vertexId] = waypoint.id;
    observableNode.notify();
  }

  void remove(WaypointId id) {
    Waypoint? waypoint = store.remove(id);
    if (waypoint == null) {
      throw Exception("No id to remove");
    }
    vertexIndex.remove(waypoint.vertexId);
    observableNode.notify();
  }
}
