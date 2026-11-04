import "package:domain_core/domain_core.dart";
import "package:riverpod/riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:user_profile_application/user_profile_application.dart";
import "package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart";

import "/core/injection/error_logger.dart";
import "/core/injection/mutation_queue_provider.dart";
part "profile_store.g.dart";

@Riverpod(keepAlive: true)
class ProfileStoreNotifier extends _$ProfileStoreNotifier
    with OptimisticRunner<ProfileStore> {
  @override
  ProfileStore build() => ProfileStore.initial();

  @override
  MutationQueue get mutationQueue => ref.read(mutationQueueProvider);

  @override
  ErrorLogger? get errorLogger => ref.read(errorLoggerProvider);
  void emit(ProfileStore newProfileStore) {
    state = newProfileStore;
  }
}

/// Profil d'un utilisateur, chargé à distance s'il n'est pas déjà en store.
/// Les profils arrivent normalement avec les voyages (fragment
/// UserProfileDetails) ; ce provider couvre l'accès direct, par exemple
/// l'ouverture d'un profil depuis un lien.
@riverpod
Future<UserProfile?> userProfileAsync(Ref ref, UserId id) async {
  final cached = ref.watch(
    profileStoreProvider.select((s) => s.profileStore.get(id)),
  );
  if (cached != null) return cached;

  final result = await ref.read(userProfileRepositoryProvider).getUser(id);

  return result.fold((failure) => throw failure, (profile) {
    ref
        .read(profileStoreProvider.notifier)
        .emit(ref.read(profileStoreProvider).insertProfile(profile));
    return profile;
  });
}
