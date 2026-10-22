import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/trip/application/trip_store.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/trip/domain/trip_repository.dart';

mixin TripEditor on OptimisticRunner<TripStore> {
  TripRepository get tripRepo;

  Future<Either<Failure, Trip>> createBlankTrip(LatLng latLng) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => tripRepo.createBlankTrip(latLng),
      onSuccess: (gs, Trip serverTrip) => gs.insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, Trip>> updateTrip(Trip trip) async {
    return await run(
      entityKey: trip.id,
      onApply: (gs) => gs,
      remote: (_) => tripRepo.updateTrip(trip),
      onSuccess: (gs, Trip serverTrip) => gs.insertTrip(serverTrip),
    );
  }

  Future<Either<Failure, void>> deleteTrip(Id<Trip> id) async {
    return await run(
      entityKey: id,
      onApply: (gs) => gs,
      remote: (_) => tripRepo.deleteTrip(id),
      onSuccess: (gs, _) => gs.removeTrip(id),
    );
  }
}
