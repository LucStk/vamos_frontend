import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/domain/types/Ids.dart';

class TripStore {
  final Map<TripId, Trip> store = {};
  TripStore();
  void clear() => store.clear();
  void upsert(Trip trip) => store[trip.id] = trip;
  void remove(TripId id) => store.remove(id);
}

extension TripStoreGetters on TripStore {
  Trip? get(TripId tripId) => store[tripId];

  Trip getRequired(TripId tripId) {
    var r = get(tripId);
    if (r == null) {
      throw Exception("Trip $tripId not found in store");
    }
    return r;
  }
}
