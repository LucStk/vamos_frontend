import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  Future<Trip> createTrip(TripDraft tripDraft) async {
    final result = await _repo.createTrip(tripDraft);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trip) => trip,
    );
  }

  Future<Trip> updateTrip(int id, TripDraft tripDraft) async {
    final result = await _repo.updateTrip(id, tripDraft);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trip) => trip,
    );
  }

  Future<void> deleteTrip(int id) async {
    final result = await _repo.deleteTrip(id);

    return result.fold((failure) => throw Exception(failure.message), (_) {});
  }
}

@riverpod
TripService tripService(Ref ref) {
  return TripService(ref.read(tripRepositoryProvider));
}
