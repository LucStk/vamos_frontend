import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:media_application/runtime/observables/observable_media_store.dart';
import 'package:trip_domain/trip_domain.dart';

class TripQueryHandler {
  final ObservableTripStore tripStore;
  final ObservableMediaStore mediaStore;
  final TripRepository repo;

  TripQueryHandler(this.tripStore, this.mediaStore, this.repo);

  Future<Either<Failure, void>> loadFromRemote() async {
    tripStore.clear();
    mediaStore.clear();
    final result = await repo.getAllTrips();
    return result.map((trips) {
      for (final (trip, listImages) in trips) {
        tripStore.upsert(trip);
        for (final i in listImages) {
          mediaStore.upsert(trip.id, i);
        }
      }
    });
  }
}
