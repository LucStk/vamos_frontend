import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/favorite_state.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/favorite_trips_providers.dart';

/// Met le voyage en favori, ou l'en retire.
///
/// Absent pour un visiteur (les favoris demandent un compte) et pour le
/// propriétaire du voyage, qui le retrouve déjà dans ses voyages. L'affichage
/// suit [isFavoriteTripProvider] : la liste des favoris est mise à jour de
/// façon optimiste, l'icône change donc tout de suite.
class TripFavoriteButton extends ConsumerWidget {
  const TripFavoriteButton({super.key, required this.tripId});

  final TripId tripId;

  Future<void> _toggle(WidgetRef ref, bool isFavorite) async {
    final me = ref.read(currentUserIdProvider);
    if (me == null) return;

    final notifier = ref.read(favoriteTripsProvider(me).notifier);
    // Lu avant l'appel réseau : le bouton peut avoir disparu après.
    final notifications = ref.read(notificationQueueProvider.notifier);
    try {
      isFavorite
          ? await notifier.remove(tripId)
          : await notifier.add(ref.read(tripSummaryProvider(tripId)));
    } catch (_) {
      notifications.show(
        message: isFavorite
            ? 'Impossible de retirer ce voyage des favoris.'
            : "Impossible d'ajouter ce voyage aux favoris.",
        type: NotificationType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(currentUserIdProvider);
    if (me == null || ref.watch(isTripOwnedProvider(tripId))) {
      return const SizedBox.shrink();
    }

    // Liste des favoris pas encore chargée (ou en erreur) : on ne sait pas
    // dans quel sens irait le bouton.
    final isFavorite = ref.watch(isFavoriteTripProvider(tripId)).value;
    if (isFavorite == null) return const SizedBox.shrink();

    return IconButton.filledTonal(
      tooltip: isFavorite ? 'Retirer des favoris' : 'Ajouter aux favoris',
      icon: Icon(isFavorite ? Icons.bookmark : Icons.bookmark_border),
      onPressed: () => _toggle(ref, isFavorite),
    );
  }
}
