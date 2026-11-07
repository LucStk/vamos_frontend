import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_header_view.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/trip_library.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/favorite_trips_providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/follow_providers.dart';

/// Onglet « Favoris » : mêmes cartes que les voyages, en lecture seule.
class UserFavoriteTrips extends ConsumerWidget {
  const UserFavoriteTrips({
    super.key,
    required this.userId,
    required this.onOpenTrip,
  });

  final UserId userId;
  final ValueChanged<Trip> onOpenTrip;

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
  });

  final AsyncValue<List<UserProfile>> users;
  final VoidCallback onRetry;
  final ValueChanged<UserId> onOpenUser;
  final String emptyMessage;

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
      ),
    );
  }
}

/// Liste purement visuelle d'utilisateurs (aucune dépendance à Riverpod).
class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.users,
    required this.onOpenUser,
    required this.emptyMessage,
  });

  final List<UserProfile> users;
  final ValueChanged<UserId> onOpenUser;
  final String emptyMessage;

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
          InkWell(
            onTap: () => onOpenUser(user.id),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ProfileHeader(profile: user),
            ),
          ),
      ],
    );
  }
}
