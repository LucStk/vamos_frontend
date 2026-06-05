import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:vamos_cartographie/features/trips/data/data.dart";
import "package:vamos_cartographie/features/trips/domain/trip.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/state/entity_store_helpers.dart';
part 'trips_notifier.g.dart';

@riverpod
class TripsNotifier extends _$TripsNotifier {
  TripRepository get repository => ref.read(tripRepositoryProvider);

  Map<int, Trip> get _current => state.value ?? <int, Trip>{};

  void _emit(Map<int, Trip> next) {
    state = AsyncData(next);
  }

  @override
  Future<Map<int, Trip>> build() => _load();

  Future<Map<int, Trip>> _load() async {
    final result = await repository.getAllTrips();

    return result.fold(
      (e) => throw Exception(e.message),
      (list) => {for (final trip in list) trip.id: trip},
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }

  Future<void> createTrip(TripDraft trip) async {
    final result = await repository.createTrip(trip);

    result.fold((_) {}, (w) {
      final next = EntityStoreHelpers.set(_current, w.id, w);
      _emit(next);
    });
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

    final result = await repository.updateTrip(id, draft);

    result.fold(
      (_) => _emit(previous), // rollback
      (server) {
        final next = EntityStoreHelpers.set(_current, server.id, server);
        _emit(next);
      },
    );
  }

  Future<void> deleteTrip(int id) async {
    final previous = _current;

    _emit(EntityStoreHelpers.remove(_current, id));

    final result = await repository.deleteTrip(id);

    result.fold(
      (_) => _emit(previous), // rollback
      (_) {},
    );
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
