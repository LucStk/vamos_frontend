import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/trip_bundle.dart';
import 'package:user_profile_application/domain/domain.dart';

abstract class TripRepository {
  Future<Either<Failure, List<TripBundle>>> getAllTripBundles();
  Future<Either<Failure, TripBundle>> getTripBundle(TripId tripId);
  Future<Either<Failure, List<TripBundle>>> getUserTripBundles(UserId id);
  Future<Either<Failure, List<TripBundle>>> getMeTripBundles();
  Future<Either<Failure, Trip>> updateTrip(Trip trip);
  Future<Either<Failure, void>> deleteTrip(TripId id);
  Future<Either<Failure, Trip>> createBlankTrip(LatLng latLng);
  Future<Either<Failure, void>> setTripOrigin(Id<Trip> id, LatLng origin);
}
