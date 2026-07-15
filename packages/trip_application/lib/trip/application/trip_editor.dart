import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import '/trip/application/trip_store.dart';
import '/trip/domain/domain.dart';

mixin TripEditor on OptimisticRunner<TripStore> {
  TripRepository get waypointRepo;

  Future<Either<Failure, Trip>> createBlankTrip() async {
    return await run(
      onApply: (gs) => gs,
      remote: () => waypointRepo.createBlankTrip(),
      onSuccess: (gs, Trip serverTrip) => gs..insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, Trip>> updateTrip(Trip trip) async {
    return await run(
      onApply: (gs) => gs,
      remote: () => waypointRepo.updateTrip(trip),
      onSuccess: (gs, Trip serverTrip) => gs..insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    return await run(
      onApply: (gs) => gs,
      remote: () => waypointRepo.deleteTrip(id),
    );
  }
}
