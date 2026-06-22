import 'package:domain_core/observable_node.dart';
import 'package:trip_domain/domain/domain.dart';

class TripStore {
  final Map<TripId, Trip> store = {};
  final ObservableNode observableNode;

  TripStore(this.observableNode);

  Trip? get(TripId tripId) => store[tripId];

  Trip getRequired(TripId tripId) {
    var r = get(tripId);
    if (r == null) {
      throw Exception("Trip $tripId not found in store");
    }
    return r;
  }

  void clear() {
    observableNode.notify();
    store.clear();
  }

  void upsert(Trip trip) {
    store[trip.id] = trip;
    observableNode.notify();
  }

  void remove(TripId id) {
    store.remove(id);
    observableNode.notify();
  }
}
