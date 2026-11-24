import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/favorite_trips_providers.dart';

// Provider écrit à la main (pas de génération) : le code qui l'utilise
// compile sans relancer build_runner pour lui.

/// Ce voyage est-il dans mes favoris ?
///
/// Dérivé de [favoriteTripsProvider] : le bouton « favori » d'un voyage et
/// l'onglet Favoris du profil changent ensemble, sans second appel réseau.
/// `AsyncLoading` tant que la liste n'est pas chargée, `false` pour un
/// visiteur.
final isFavoriteTripProvider = Provider.autoDispose
    .family<AsyncValue<bool>, TripId>((ref, tripId) {
      final me = ref.watch(currentUserIdProvider);
      if (me == null) return const AsyncValue.data(false);

      return ref
          .watch(favoriteTripsProvider(me))
          .whenData(
            (favorites) =>
                favorites.any((summary) => summary.trip.id == tripId),
          );
    });
