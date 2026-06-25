import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/application/repositories/trip_repository.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:trip_domain/runtime/runtime.dart';

import 'package:domain_core/optimitic_executor.dart';

class TripHandler {
  ObservableTripStore tripStore;
  ObservableMediaStore mediaStore;
  TripRepository repo;
  OptimisticExecutor executor;

  TripHandler(this.tripStore, this.mediaStore, this.repo, this.executor);

  void loadFromRemote() async {
    tripStore.clear();
    mediaStore.clear(); // ajout
    final result = await repo.getAllTrips();
    result.fold((failure) => throw Exception(failure.message), (
      List<Trip> trips,
    ) {
      for (final trip in trips) {
        tripStore.upsert(trip);
      }
    });
  }

  Future<Trip> createBlankTrip() async {
    final result = await repo.createBlankTrip();

    return result.fold((f) => throw Exception(f.message), (trip) {
      tripStore.upsert(trip);
      return trip;
    });
  }

  Future<void> updateTrip(Trip trip) async {
    final old = tripStore.getRequired(trip.id);

    await executor.run(
      onApply: () => tripStore.upsert(trip),
      remote: () => repo.updateTrip(trip),
      onSuccess: (Trip serverTrip) => tripStore.upsert(serverTrip),
      onError: () => tripStore.upsert(old),
    );
  }

  Future<void> deleteTrip(Id<Trip> id) async {
    final old = tripStore.getRequired(id);
    await executor.run(
      onApply: () => tripStore.remove(id),
      remote: () => repo.deleteTrip(id),
      onSuccess: (_) {},
      onError: () => tripStore.upsert(old),
    );
  }
}
