import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/core/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/notification_provider.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/follow_button.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/trip_library.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/user_tile.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/favorite_trips_providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_providers.dart';

/// Onglet « Favoris » : mêmes cartes que les voyages, qu'on peut ouvrir ou
/// retirer des favoris. L'onglet n'existe que sur son propre profil (les
/// favoris sont privés), donc retirer y est toujours permis.
class UserFavoriteTrips extends ConsumerWidget {
  const UserFavoriteTrips({
    super.key,
    required this.userId,
    required this.onOpenTrip,
  });

  final UserId userId;
  final ValueChanged<Trip> onOpenTrip;

  Future<void> _remove(WidgetRef ref, TripId tripId) async {
    final notifier = ref.read(favoriteTripsProvider(userId).notifier);
    // Lu avant l'appel réseau : la carte disparaît de la liste entre-temps.
    final notifications = ref.read(notificationQueueProvider.notifier);
    try {
      await notifier.remove(tripId);
    } catch (_) {
      notifications.show(
        message: 'Impossible de retirer ce voyage des favoris.',
        type: NotificationType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final load = ref.watch(loadFavoriteTripsProvider(userId));
    final trips = ref.watch(favoriteTripSummariesProvider(userId));

    return TripLibrary.viewer(
      trips: trips,
      isLoading: load.isLoading,
      hasError: load.hasError,
      onRetry: () => ref.invalidate(loadFavoriteTripsProvider(userId)),
      onOpenTrip: onOpenTrip,
      onRemoveFavorite: (tripId) => _remove(ref, tripId),
    );
  }
}

/// Onglet « Abonnements » : les utilisateurs que cet utilisateur suit.
class UserFollowingList extends ConsumerWidget {
  const UserFollowingList({
    super.key,
    required this.userId,
    required this.onOpenUser,
  });

  final UserId userId;
  final ValueChanged<UserId> onOpenUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncUserList(
      users: ref.watch(userFollowingProvider(userId)),
      onRetry: () => ref.invalidate(userFollowingProvider(userId)),
      onOpenUser: onOpenUser,
      emptyMessage: 'Aucun abonnement pour l\'instant.',
      // Sur mon profil : « Suivi », donc un clic ne suit plus (après
      // confirmation). Sur celui d'un autre : mon propre lien avec ces gens.
      trailingBuilder: (user) => FollowButton(profile: user),
    );
  }
}

/// Onglet « Abonnés » : les utilisateurs qui suivent cet utilisateur.
class UserFollowersList extends ConsumerWidget {
  const UserFollowersList({
    super.key,
    required this.userId,
    required this.onOpenUser,
  });

  final UserId userId;
  final ValueChanged<UserId> onOpenUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncUserList(
      users: ref.watch(userFollowersProvider(userId)),
      onRetry: () => ref.invalidate(userFollowersProvider(userId)),
      onOpenUser: onOpenUser,
      emptyMessage: 'Aucun abonné pour l\'instant.',
    );
  }
}

/// Gère loading / erreur / vide pour une liste d'utilisateurs.
class AsyncUserList extends StatelessWidget {
  const AsyncUserList({
    super.key,
    required this.users,
    required this.onRetry,
    required this.onOpenUser,
    required this.emptyMessage,
    this.trailingBuilder,
  });

  final AsyncValue<List<UserProfile>> users;
  final VoidCallback onRetry;
  final ValueChanged<UserId> onOpenUser;
  final String emptyMessage;

  /// Ce qu'on met au bout de chaque ligne. null : rien.
  final Widget Function(UserProfile user)? trailingBuilder;

  @override
  Widget build(BuildContext context) {
    return users.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Row(
        children: [
          const Expanded(child: Text('Impossible de charger la liste.')),
          TextButton(onPressed: onRetry, child: const Text('Réessayer')),
        ],
      ),
      data: (list) => UserList(
        users: list,
        onOpenUser: onOpenUser,
        emptyMessage: emptyMessage,
        trailingBuilder: trailingBuilder,
      ),
    );
  }
}

/// Liste purement visuelle d'utilisateurs, une ligne par personne (aucune
/// dépendance à Riverpod : ce que [trailingBuilder] renvoie peut en avoir).
class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.users,
    required this.onOpenUser,
    required this.emptyMessage,
    this.trailingBuilder,
  });

  final List<UserProfile> users;
  final ValueChanged<UserId> onOpenUser;
  final String emptyMessage;
  final Widget Function(UserProfile user)? trailingBuilder;

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(child: Text(emptyMessage)),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final user in users)
          UserTile(
            user: user,
            onTap: () => onOpenUser(user.id),
            trailing: trailingBuilder?.call(user),
          ),
      ],
    );
  }
}
