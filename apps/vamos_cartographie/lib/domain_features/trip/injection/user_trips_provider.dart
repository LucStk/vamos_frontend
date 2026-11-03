import "package:riverpod/riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:stored_file_application/application/stored_file_store.dart";
import "package:trip_application/trip_application.dart";
import "package:user_profile_application/domain/user_profile_model.dart";
import "package:vamos_cartographie/domain_features/stored_file/injection/injection.dart";
import "package:vamos_cartographie/domain_features/trip/injection/trip_store.dart";
// + imports de tripStoreProvider / storedFileStoreProvider

part "user_trips_provider.g.dart";

@Riverpod(keepAlive: true)
Iterable<TripId> userTripsIds(Ref ref, UserId userId) =>
    ref.watch(tripStoreProvider.select((s) => s.tripIdsOf(userId)));

@riverpod
List<Trip> userTrips(Ref ref, UserId userId) =>
    ref.watch(tripStoreProvider).tripsOf(userId);

/// Données : reconstruites depuis les stores (trips indexés par owner + fichiers par trip).
@riverpod
List<TripSummary> userTripSummaries(Ref ref, UserId userId) {
  final trips = ref.watch(tripStoreProvider).tripsOf(userId);
  final files = ref.watch(storedFileStoreProvider);

  return [
    for (final trip in trips)
      TripSummary(
        trip: trip,
        storedFiles: [
          for (final id in files.getFromOwner(trip.id))
            if (files.get(id) case final node?)
              node.current, // à adapter, voir remarque 1
        ],
      ),
  ];
}
