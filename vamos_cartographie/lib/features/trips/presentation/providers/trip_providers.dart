import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/repositories.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:get_it/get_it.dart";

final getIt = GetIt.instance;

// CORRECTION ICI : Un seul paramètre (id) est attendu par la closure
final tripProvider = AsyncNotifierProvider.family<TripNotifier, Trip, int>(
  (id) => TripNotifier(id),
);

class TripNotifier extends AsyncNotifier<Trip> {
  final int tripId;
  late final ITripRepository _repo;

  TripNotifier(this.tripId);

  @override
  Future<Trip> build() async {
    _repo = getIt<ITripRepository>();

    final result = await _repo.getTrip(tripId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trip) => trip,
    );
  }

  Future<void> save(Trip trip) async {
    state = const AsyncLoading();

    final result = await _repo.updateTrip(trip.id!, trip);

    result.fold(
      (failure) {
        state = AsyncError(Exception(failure.message), StackTrace.current);
      },
      (updatedTrip) {
        state = AsyncData(updatedTrip);
      },
    );
  }

  void updateLocal(Trip trip) {
    state = AsyncData(trip);
  }
}
