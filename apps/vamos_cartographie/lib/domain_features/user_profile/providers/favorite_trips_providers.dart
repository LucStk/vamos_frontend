import "package:riverpod/riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:user_profile_application/user_profile_application.dart";

// TODO: chemin inventé, à remplacer par le fichier qui expose ton repository.
import "package:vamos_cartographie/domain_features/trip/injection/trip_store.dart";

part "favorite_trips_providers.g.dart";

/// Source de vérité des favoris de [userId].
///
/// `add` / `remove` mettent la liste à jour localement (optimiste, avec
/// rollback si l'appel échoue) : l'onglet Favoris et un éventuel bouton
/// « favori » sur la fiche d'un voyage restent synchronisés sans refetch.
///
/// Sémantique : `favoriteTripsProvider(me).notifier.add(summary)` veut dire
/// « j'ajoute ce voyage à mes favoris ». Seul l'utilisateur connecté peut
/// modifier ses propres favoris.
@riverpod
class FavoriteTrips extends _$FavoriteTrips {
  @override
  Future<List<TripSummary>> build(UserId userId) async {
    final result = await ref
        .read(tripRepositoryProvider)
        .getFavoriteTrips(userId);
    return result.fold((failure) => throw failure, (list) => list);
  }

  Future<void> add(TripSummary trip) {
    return _update(
      next: (current) => current.any((s) => s.trip.id == trip.trip.id)
          ? current
          : [trip, ...current],
      call: () async {
        final result = await ref
            .read(tripRepositoryProvider)
            .addFavorite(trip.trip.id);
        result.fold((failure) => throw failure, (_) {});
      },
    );
  }

  Future<void> remove(TripId tripId) {
    return _update(
      next: (current) => current.where((s) => s.trip.id != tripId).toList(),
      call: () async {
        final result = await ref
            .read(tripRepositoryProvider)
            .removeFavorite(tripId);
        result.fold((failure) => throw failure, (_) {});
      },
    );
  }

  Future<void> _update({
    required List<TripSummary> Function(List<TripSummary> current) next,
    required Future<void> Function() call,
  }) async {
    // Empêche l'autoDispose de tuer le provider pendant l'appel réseau.
    final link = ref.keepAlive();
    try {
      final previous = await future;

      state = AsyncData(next(previous)); // optimiste
      try {
        await call();
      } catch (_) {
        state = AsyncData(previous); // rollback
        rethrow;
      }
    } finally {
      link.close();
    }
  }
}

/// Statut de chargement des favoris (même contrat que `loadUserTripsProvider`).
///
/// Dérivé de [favoriteTripsProvider] : pour relancer le chargement, invalide
/// `favoriteTripsProvider(userId)`, pas ce provider-ci.
@riverpod
AsyncValue<void> loadFavoriteTrips(Ref ref, UserId userId) {
  return ref.watch(
    favoriteTripsProvider(
      userId,
    ).select((favorites) => favorites.whenData((_) {})),
  );
}

/// Données des favoris (même contrat que `userTripSummariesProvider`).
@riverpod
List<TripSummary> favoriteTripSummaries(Ref ref, UserId userId) {
  return ref.watch(favoriteTripsProvider(userId)).value ?? const [];
}
