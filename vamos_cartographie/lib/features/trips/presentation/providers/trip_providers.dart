import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/repositories.dart';
// 1. On utilise un alias pour l'import des entités si nécessaire,
// mais en renommant la classe, le conflit principal disparaît !
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';

part 'trip_providers.g.dart';

final getIt = GetIt.instance;

@riverpod
class TripNotifier extends _$TripNotifier {
  // <-- On hérite de _$TripNotifier
  late final ITripRepository _repo;

  @override
  Future<Trip> build(int tripId) async {
    // <-- Ici, 'Trip' est à nouveau ton entité d'origine sans conflit
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
