import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_profile_application/application/application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/stored_file/helpers/bulk_upserts.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';

part 'trip_data_loader.g.dart';

typedef StoredFilesByTrip = List<TripSummary>;

/// État accumulé pendant l'ingestion d'un lot de trips.
typedef IngestState = ({
  ProfileStore profiles,
  TripStore trips,
  StoredFilesByTrip files,
});

/// Ajoute un bundle à l'état accumulé. Pure : ne touche à aucun provider.
/// `files` est mutée volontairement (évite une copie par trip).
IngestState ingestTrip(IngestState state, TripBundle bundle) {
  state.files.add(bundle.tripSummary);
  return (
    profiles: state.profiles.insertProfile(bundle.user),
    trips: state.trips.insertTrip(bundle.tripSummary.trip),
    files: state.files,
  );
}

/// Fusionne les bundles dans les stores existants (n'écrase rien d'autre).
void ingestTrips(Ref ref, Iterable<TripBundle> bundles) {
  var state = (
    profiles: ref.read(profileStoreProvider),
    trips: ref.read(tripStoreProvider),
    files: <TripSummary>[],
  );

  for (final bundle in bundles) {
    state = ingestTrip(state, bundle);

    // Famille indexée par tripId : un notifier par trip, donc hors de l'accumulateur.
    ref
        .read(routeStoreProvider(bundle.tripSummary.trip.id).notifier)
        .emit(
          RouteStore.fromRemote(
            route: bundle.route,
            sections: bundle.routeSections,
          ),
        );
  }

  // Une seule émission par store, après la boucle.
  ref.read(tripStoreProvider.notifier).emit(state.trips);
  ref.read(profileStoreProvider.notifier).emit(state.profiles);
  ref
      .read(storedFileStoreProvider.notifier)
      .emit(ref.read(storedFileStoreProvider).upsertRemoteFiles(state.files));
}

@riverpod
Future<Failure?> loadTrips(Ref ref) async {
  final res = await ref.watch(tripRepositoryProvider).getAllTripBundles();
  return res.fold((f) => f, (data) {
    ingestTrips(ref, data);
    return null;
  });
}

@riverpod
Future<Failure?> ensureTripLoaded(Ref ref, TripId tripId) async {
  final hasTrip = ref.read(tripProvider(tripId)) != null;
  final hasRoute = ref.read(routeStoreProvider(tripId)).route != null;
  if (hasTrip && hasRoute) return null; // rien à faire

  final link = ref.keepAlive(); // dédoublonne les appels concurrents
  final res = await ref.read(tripRepositoryProvider).getTripBundle(tripId);

  return res.fold(
    (f) {
      link.close(); // échec : pas de mémo, le prochain appel réessaie
      return f;
    },
    (bundle) {
      ingestTrips(ref, [bundle]);
      return null; // succès : mémorisé tant que le provider reste vivant
    },
  );
}
