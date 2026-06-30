import 'package:domain_core/observable.dart';
import 'package:trip_domain/domain/entities/waypoint.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:trip_domain/runtime/store/waypoint_store.dart';

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
