import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:user_profile_application/user_profile_application.dart";
import "package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart";
import "package:vamos_cartographie/domain_features/user_profile/user_profile.dart";

part "follow_providers.g.dart";

/// Les utilisateurs qui suivent [userId].
///
/// Lecture seule : un simple fetch, mis en cache par Riverpod tant que
/// quelqu'un l'écoute (autoDispose). Pour forcer un rechargement :
/// `ref.invalidate(userFollowersProvider(userId))`.
@riverpod
Future<List<UserProfile>> userFollowers(Ref ref, UserId userId) async {
  final result = await ref
      .read(userProfileRepositoryProvider)
      .getFollowers(userId);
  final profiles = result.fold((failure) => throw failure, (list) => list);

  _cacheProfiles(ref, profiles);
  return profiles;
}

/// Les utilisateurs que [userId] suit.
///
/// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
/// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
/// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
///
/// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
/// « moi, je suis target ».
@riverpod
class UserFollowing extends _$UserFollowing {
  @override
  Future<List<UserProfile>> build(UserId userId) async {
    final result = await ref
        .read(userProfileRepositoryProvider)
        .getFollowing(userId);
    final profiles = result.fold((failure) => throw failure, (list) => list);

    _cacheProfiles(ref, profiles);
    return profiles;
  }

  Future<void> follow(UserProfile target) {
    return _update(
      otherUserId: target.id,
      next: (current) => current.any((p) => p.id == target.id)
          ? current
          : [...current, target],
      call: () async {
        final result = await ref
            .read(userProfileRepositoryProvider)
            .followUser(target.id);
        result.fold((failure) => throw failure, (_) {});
      },
    );
  }

  Future<void> unfollow(UserId targetId) {
    return _update(
      otherUserId: targetId,
      next: (current) => current.where((p) => p.id != targetId).toList(),
      call: () async {
        final result = await ref
            .read(userProfileRepositoryProvider)
            .unfollowUser(targetId);
        result.fold((failure) => throw failure, (_) {});
      },
    );
  }

  Future<void> _update({
    required UserId otherUserId,
    required List<UserProfile> Function(List<UserProfile> current) next,
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

      // La liste des abonnés de l'autre utilisateur a changé aussi.
      ref.invalidate(userFollowersProvider(otherUserId));
    } finally {
      link.close();
    }
  }
}

/// Alimente le cache de profils (même mécanique que `userProfileAsync`),
/// pour qu'ouvrir un profil depuis une liste soit instantané.
void _cacheProfiles(Ref ref, List<UserProfile> profiles) {
  var store = ref.read(profileStoreProvider);
  for (final profile in profiles) {
    store = store.insertProfile(profile);
  }
  ref.read(profileStoreProvider.notifier).emit(store);
}
