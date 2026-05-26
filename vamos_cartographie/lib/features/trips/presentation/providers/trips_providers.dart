import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/repositories.dart';
import "package:riverpod/riverpod.dart";
import "package:get_it/get_it.dart";

final getIt = GetIt.instance;

class TripsNotifier extends AsyncNotifier<List<Trip>> {
  late final ITripRepository repository;

  @override
  Future<List<Trip>> build() async {
    repository = ref.read(_tripRepositoryProvider);

    return _loadTrips();
  }

  Future<List<Trip>> _loadTrips() async {
    final result = await repository.getAllTrips();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (trips) => trips,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return _loadTrips();
    });
  }

  Future<void> createTrip(Trip trip) async {
    final result = await repository.createTrip(trip);

    result.fold((failure) => throw Exception(failure.message), (createdTrip) {
      final current = state.value ?? [];

      state = AsyncData([createdTrip, ...current]);
    });
  }

  Future<void> updateTrip(int id, Trip trip) async {
    final previous = state.value ?? [];

    // optimistic update
    state = AsyncData([
      for (final t in previous)
        if (t.id == id) trip else t,
    ]);

    final result = await repository.updateTrip(id, trip);

    result.fold(
      (_) {
        // rollback
        state = AsyncData(previous);
      },
      (serverTrip) {
        // sync avec vérité serveur
        state = AsyncData([
          for (final t in state.value ?? [])
            if (t.id == id) serverTrip else t,
        ]);
      },
    );
  }

  Future<void> deleteTrip(int id) async {
    final result = await repository.deleteTrip(id);

    result.fold((failure) => throw Exception(failure.message), (_) {
      final current = state.value ?? [];

      state = AsyncData(current.where((t) => t.id != id).toList());
    });
  }
}

final _tripRepositoryProvider = Provider<ITripRepository>((ref) {
  return getIt<ITripRepository>();
});

final tripsProvider = AsyncNotifierProvider<TripsNotifier, List<Trip>>(
  TripsNotifier.new,
);

final tripProvider = FutureProvider.family<Trip, int>((ref, tripId) async {
  // Demande un certain "Trip" au réseau
  final repository = ref.read(_tripRepositoryProvider);

  final result = await repository.getTrip(tripId);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (trip) => trip,
  );
});
