import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/trips/data/trip_repository.dart';
import 'package:vamos_cartographie/features/trips/data/trip_providers.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
part "trip_service.g.dart";

class TripService {
  final TripRepository _repo;
  TripService(this._repo);

  Future<Map<int, Trip>> getAllTrips() async {
    final result = await _repo.getAllTrips();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => {for (final trip in trips) trip.id: trip},
    );
  }

  Future<Either<Failure, Trip>> createTrip(TripDraft tripDraft) async {
    return await _repo.createTrip(tripDraft);
  }

  Future<Either<Failure, Trip>> updateTrip(int id, TripDraft tripDraft) async {
    return await _repo.updateTrip(id, tripDraft);
  }

  Future<Either<Failure, void>> deleteTrip(int id) async {
    return await _repo.deleteTrip(id);
  }
}

@riverpod
TripService tripService(Ref ref) {
  return TripService(ref.read(tripRepositoryProvider));
}
