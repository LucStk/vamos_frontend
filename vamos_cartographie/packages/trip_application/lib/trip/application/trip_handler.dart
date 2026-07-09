import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:domain_core/optimitic_executor.dart';
import "package:media_application/media_application.dart";
import 'package:trip_application/trip/domain/trip.dart';
import 'package:trip_application/trip/domain/trip_repository.dart';
import 'package:trip_application/trip/runtime/observable_trip_store.dart';
import 'package:trip_application/trip/runtime/runtime.dart';

class TripHandler {
  ObservableTripStore tripStore;
  ObservableMediaStore mediaStore;
  TripRepository repo;
  OptimisticExecutor executor;

  TripHandler(this.tripStore, this.mediaStore, this.repo, this.executor);

  Future<Either<Failure, Trip>> createBlankTrip() async {
    return await executor.run(
      onApply: () {},
      remote: () => repo.createBlankTrip(),
      onSuccess: (Trip serverTrip) => tripStore.upsert(serverTrip),
      onError: (Failure failure) {},
    );
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
