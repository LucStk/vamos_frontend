import 'package:trip_domain/domain/waypoint.dart';

class WaypointStore {
  final Map<WaypointId, Waypoint> store = {};

  WaypointStore();

  void clear() {
    store.clear();
  }

  Waypoint? get(WaypointId id) => store[id];

  Waypoint getRequired(WaypointId id) {
    var r = get(id);
    if (r == null) {
      throw Exception("Waypoint $id not found in store");
    }
    return r;
  }

  void upsert(Waypoint waypoint) => store[waypoint.id] = waypoint;
  void remove(WaypointId id) => store.remove(id);
}
