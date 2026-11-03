import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/owner_index.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'trip_store.freezed.dart';

@freezed
abstract class TripStore with _$TripStore {
  const TripStore._();

  const factory TripStore({
    required SimpleCollectionStore<Trip> tripStore,
    required OwnerIndex<UserId, TripId> ownerIndex,
  }) = _TripStore;

  // Pas de `const` : OwnerIndex n'a pas de constructeur const.
  factory TripStore.initial() => TripStore(
    tripStore: SimpleCollectionStore<Trip>(),
    ownerIndex: OwnerIndex<UserId, TripId>(),
  );

  TripStore clear() => TripStore.initial();

  TripStore insertTrip(Trip trip) {
    final index = ownerIndex.copy()..addRelationship(trip.ownerId, trip.id);
    return copyWith(tripStore: tripStore.insert(trip), ownerIndex: index);
  }

  /// Un seul copy() de l'index et de la map, quel que soit le nombre de trips.
  TripStore insertAll(Iterable<Trip> trips) {
    final index = ownerIndex.copy();
    final map = Map<TripId, Trip>.from(tripStore.store);
    for (final trip in trips) {
      map[trip.id] = trip;
      index.addRelationship(trip.ownerId, trip.id);
    }
    return copyWith(
      tripStore: tripStore.copyWith(store: map),
      ownerIndex: index,
    );
  }

  TripStore removeTrip(TripId id) {
    final index = ownerIndex.copy()..removeOwned(id);
    return copyWith(tripStore: tripStore.remove(id), ownerIndex: index);
  }

  // --- Lecture ---

  Set<TripId> tripIdsOf(UserId owner) => ownerIndex.owneds(owner);

  List<Trip> tripsOf(UserId owner) => tripIdsOf(owner)
      .map(tripStore.get)
      .whereType<Trip>() // ignore un éventuel id absent du store
      .toList();
}
