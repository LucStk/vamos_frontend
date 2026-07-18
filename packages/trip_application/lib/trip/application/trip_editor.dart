import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/trip/application/trip_store.dart';
import '/trip/domain/domain.dart';

mixin TripEditor on OptimisticRunner<TripStore> {
  TripRepository get tripRepo;

  Future<Either<Failure, Trip>> createBlankTrip() async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => tripRepo.createBlankTrip(),
      onSuccess: (gs, Trip serverTrip) => gs.insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, Trip>> updateTrip(Trip trip) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => tripRepo.updateTrip(trip),
      onSuccess: (gs, Trip serverTrip) => gs.insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => tripRepo.deleteTrip(id),
    );
  }

  Future<Either<Failure, void>> attachFileToTrip(
    TripId tripId,
    StoredFileId fileId,
  ) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => tripRepo.attachFileToTrip(tripId, fileId),
    );
  }
}
