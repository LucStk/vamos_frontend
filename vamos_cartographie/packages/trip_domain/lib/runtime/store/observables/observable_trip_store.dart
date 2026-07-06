import 'package:domain_core/observable.dart';
import 'package:trip_domain/domain/entities/trip.dart';
import 'package:trip_domain/domain/types/Ids.dart';
import 'package:trip_domain/runtime/store/trip_store.dart';

class ObservableTripStore extends TripStore with Observable {
  @override
  void upsert(Trip trip) {
    super.upsert(trip);
    notify();
  }

  @override
  void remove(TripId id) {
    super.remove(id);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}
