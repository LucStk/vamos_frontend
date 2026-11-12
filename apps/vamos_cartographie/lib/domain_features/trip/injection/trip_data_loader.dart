import 'package:domain_core/domain_core.dart';
import 'package:flutter/rendering.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_profile_application/application/application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
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
  List<WaypointPayload> waypoints,
});

IngestState ingestTrip(IngestState state, TripBundle bundle) {
  state.files.add(bundle.tripSummary);
  state.waypoints.addAll(bundle.waypoints); // mutée, comme `files`
  return (
    profiles: state.profiles.insertProfile(bundle.user),
    trips: state.trips.insertTrip(bundle.tripSummary.trip),
    files: state.files,
    waypoints: state.waypoints,
  );
}

/// Fusionne les bundles dans les stores existants (n'écrase rien d'autre).
void ingestTrips(Ref ref, Iterable<TripBundle> bundles) {
  var state = (
    profiles: ref.read(profileStoreProvider),
    trips: ref.read(tripStoreProvider),
    files: <TripSummary>[],
    waypoints: <WaypointPayload>[],
  );

  for (final bundle in bundles) {
    state = ingestTrip(state, bundle);
    final tripId = bundle.tripSummary.trip.id;

    ref
        .read(routeStoreProvider(tripId).notifier)
        .emit(
          RouteStore.fromRemote(
            route: bundle.route,
            editSpans: bundle.editSpans,
            mobilitySpans: bundle.mobilitySpans,
          ),
        );

    // Famille par tripId, comme la route. Même sans waypoint, on émet : un
    // rechargement doit vider ceux qui ont disparu côté serveur.
    ref
        .read(waypointStoreProvider(tripId).notifier)
        .emit(
          WaypointStore.fromRemote(bundle.waypoints.map((p) => p.waypoint)),
        );
  }

  ref.read(tripStoreProvider.notifier).emit(state.trips);
  ref.read(profileStoreProvider.notifier).emit(state.profiles);
  ref
      .read(storedFileStoreProvider.notifier)
      .emit(
        ref
            .read(storedFileStoreProvider)
            .upsertRemoteFiles(state.files)
            .upsertWaypointImages(state.waypoints),
      );
}

@Riverpod(keepAlive: true)
Future<Failure?> loadTrips(Ref ref) async {
  final res = await ref.read(tripRepositoryProvider).getAllTripBundles();
  return res.fold((f) => f, (data) {
    try {
      ingestTrips(ref, data);
    } catch (e, st) {
      debugPrint('ingestTrips a échoué : $e\n$st');
      rethrow;
    }
    return null;
  });
}

@Riverpod(keepAlive: true)
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

/// Ingestion partielle : trips + fichiers uniquement.
/// Ne touche ni aux profils ni aux routes (absents d'un summary).
void ingestTripSummaries(Ref ref, List<TripSummary> summaries) {
  if (summaries.isEmpty) return;

  // Un seul copy() de l'index pour tout le lot (insertAll).
  ref
      .read(tripStoreProvider.notifier)
      .emit(
        ref.read(tripStoreProvider).insertAll(summaries.map((s) => s.trip)),
      );

  ref
      .read(storedFileStoreProvider.notifier)
      .emit(ref.read(storedFileStoreProvider).upsertRemoteFiles(summaries));
}

@riverpod
Future<void> loadUserTrips(Ref ref, UserId userId) async {
  final link = ref.keepAlive(); // survit à un éventuel dispose pendant l'await

  final result = await ref
      .read(tripRepositoryProvider)
      .getUserTripsSummary(userId);

  return result.fold(
    (failure) {
      link.close(); // échec : pas de mémo, le prochain watch réessaie
      throw failure;
    },
    (summaries) => ingestTripSummaries(ref, summaries), // succès : mémorisé
  );
}
