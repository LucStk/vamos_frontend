import 'package:dartz/dartz.dart';
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

  Future<Either<Failure, void>> loadFromRemote() async {
    tripStore.clear();
    mediaStore.clear();
    final result = await repo.getAllTrips();
    return result.map((trips) {
      for (final trip in trips) {
        tripStore.upsert(trip);
      }
    });
  }

  Future<Either<Failure, Trip>> createBlankTrip() async {
    final result = await repo.createBlankTrip();

    return result.fold((f) => Left(f), (trip) {
      tripStore.upsert(trip);
      return Right(trip);
    });
  }

  Future<Either<Failure, Trip>> updateTrip(Trip trip) async {
    final old = tripStore.getRequired(trip.id);
    return await executor.run(
      onApply: () => tripStore.upsert(trip),
      remote: () => repo.updateTrip(trip),
      onSuccess: (Trip serverTrip) => tripStore.upsert(serverTrip),
      onError: (Failure failure) => tripStore.upsert(old),
    );
  }

  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    final old = tripStore.getRequired(id);
    return await executor.run(
      onApply: () => tripStore.remove(id),
      remote: () => repo.deleteTrip(id),
      onSuccess: (_) {},
      onError: (Failure failure) => tripStore.upsert(old),
    );
  }
}
