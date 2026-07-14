import 'package:trip_application/shared/shared.dart';
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

  TripStore upsertTrip(Trip trip) {
    return copyWith(tripStore: tripStore.upsert(trip));
  }

  TripStore removeTrip(TripId id) {
    return copyWith(tripStore: tripStore.remove(id));
  }
}
