import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip/domain/domain.dart';

class TripStore {
  SimpleCollectionStore<Trip> tripStore;

  TripStore({required this.tripStore});
  TripStore.initial() : tripStore = SimpleCollectionStore<Trip>();

  TripStore copyWith({SimpleCollectionStore<Trip>? tripStore}) {
    return TripStore(tripStore: tripStore ?? this.tripStore);
  }

  TripStore clear() {
    return copyWith(tripStore: SimpleCollectionStore<Trip>());
  }

  TripStore insertTrip(Trip trip) {
    return copyWith(tripStore: tripStore.insert(trip));
  }

  TripStore removeTrip(TripId id) {
    return copyWith(tripStore: tripStore.remove(id));
  }
}
