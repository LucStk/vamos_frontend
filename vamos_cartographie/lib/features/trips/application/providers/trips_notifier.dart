import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/trips/domain/trip.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
import 'package:vamos_cartographie/features/trips/application/services/trip_service.dart';
part 'trips_notifier.g.dart';

@riverpod
class TripsNotifier extends _$TripsNotifier {
  TripService get service => ref.read(tripServiceProvider);

  Map<int, Trip> get _current => state.value ?? <int, Trip>{};

  void _emit(Map<int, Trip> next) {
    state = AsyncData(next);
  }

  @override
  Future<Map<int, Trip>> build() async => await service.getAllTrips();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await service.getAllTrips());
  }

  Future<void> createTrip(TripDraft tripDraft) async {
    final trip = await service.createTrip(tripDraft);
    _emit(EntityStoreHelpers.set(_current, trip.id, trip));
  }

  Future<void> updateTrip(int id, TripDraft draft) async {
    final previous = _current;

    final existing = previous[id];
    if (existing == null) return;

    final optimistic = existing.copyWith(
      title: draft.title,
      description: draft.description,
      date: draft.date,
      images: draft.images,
    );
    _emit(EntityStoreHelpers.update(previous, id, optimistic));

    try {
      final server = await service.updateTrip(id, draft);
      _emit(EntityStoreHelpers.set(_current, server.id, server));
    } catch (_) {
      _emit(previous); // rollback
    }
  }

  Future<void> deleteTrip(int id) async {
    final previous = _current;

    _emit(EntityStoreHelpers.remove(_current, id));

    try {
      await service.deleteTrip(id);
    } catch (_) {
      _emit(previous);
    }
  }
}

@riverpod
Iterable<int> tripIds(Ref ref) {
  return ref.watch(
    tripsProvider.select(
      (asyncTrips) => (asyncTrips.value ?? const <int, Trip>{}).keys,
    ),
  );
}

@riverpod
AsyncValue<Trip?> trip(Ref ref, int tripId) {
  return ref.watch(
    tripsProvider.select(
      (asyncTrips) => asyncTrips.whenData((map) => map[tripId]),
    ),
  );
}
