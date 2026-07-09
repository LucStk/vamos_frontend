import 'package:domain_core/observable.dart';
import 'package:trip_application/waypoint/domain/domain.dart';
import "waypoint_store.dart";

class ObservableWaypointStore extends WaypointStore with Observable {
  @override
  void upsert(Waypoint waypoint) {
    super.upsert(waypoint);
    notify();
  }

  @override
  void remove(WaypointId id) {
    super.remove(id);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}
