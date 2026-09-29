import "package:domain_core/domain_core.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:user_profile_application/user_profile_application.dart";
import "package:vamos_cartographie/core/injection/injection.dart";
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

@riverpod
UserProfile? userProfile(Ref ref, UserId id) {
  return ref.watch(profileStoreProvider).profileStore.get(id);
}
