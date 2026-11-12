// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileStoreNotifier)
final profileStoreProvider = ProfileStoreNotifierProvider._();

final class ProfileStoreNotifierProvider
    extends $NotifierProvider<ProfileStoreNotifier, ProfileStore> {
  ProfileStoreNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileStoreNotifierHash();

  @$internal
  @override
  ProfileStoreNotifier create() => ProfileStoreNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileStore>(value),
    );
  }
}

String _$profileStoreNotifierHash() =>
    r'6526cca9b6a498f42614cab74b2c52cc31814d39';

abstract class _$ProfileStoreNotifier extends $Notifier<ProfileStore> {
  ProfileStore build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ProfileStore, ProfileStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileStore, ProfileStore>,
              ProfileStore,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Profil d'un utilisateur, chargé à distance s'il n'est pas déjà en store.
/// Les profils arrivent normalement avec les voyages (fragment
/// UserProfileDetails) ; ce provider couvre l'accès direct, par exemple
/// l'ouverture d'un profil depuis un lien.

@ProviderFor(userProfileAsync)
final userProfileAsyncProvider = UserProfileAsyncFamily._();

/// Profil d'un utilisateur, chargé à distance s'il n'est pas déjà en store.
/// Les profils arrivent normalement avec les voyages (fragment
/// UserProfileDetails) ; ce provider couvre l'accès direct, par exemple
/// l'ouverture d'un profil depuis un lien.

final class UserProfileAsyncProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserProfile?>,
          UserProfile?,
          FutureOr<UserProfile?>
        >
    with $FutureModifier<UserProfile?>, $FutureProvider<UserProfile?> {
  /// Profil d'un utilisateur, chargé à distance s'il n'est pas déjà en store.
  /// Les profils arrivent normalement avec les voyages (fragment
  /// UserProfileDetails) ; ce provider couvre l'accès direct, par exemple
  /// l'ouverture d'un profil depuis un lien.
  UserProfileAsyncProvider._({
    required UserProfileAsyncFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userProfileAsyncProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userProfileAsyncHash();

  @override
  String toString() {
    return r'userProfileAsyncProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserProfile?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserProfile?> create(Ref ref) {
    final argument = this.argument as UserId;
    return userProfileAsync(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileAsyncProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userProfileAsyncHash() => r'63a5e1cd01846bfeff681b01882018648d62bcd9';

/// Profil d'un utilisateur, chargé à distance s'il n'est pas déjà en store.
/// Les profils arrivent normalement avec les voyages (fragment
/// UserProfileDetails) ; ce provider couvre l'accès direct, par exemple
/// l'ouverture d'un profil depuis un lien.

final class UserProfileAsyncFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserProfile?>, UserId> {
  UserProfileAsyncFamily._()
    : super(
        retry: null,
        name: r'userProfileAsyncProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Profil d'un utilisateur, chargé à distance s'il n'est pas déjà en store.
  /// Les profils arrivent normalement avec les voyages (fragment
  /// UserProfileDetails) ; ce provider couvre l'accès direct, par exemple
  /// l'ouverture d'un profil depuis un lien.

  UserProfileAsyncProvider call(UserId id) =>
      UserProfileAsyncProvider._(argument: id, from: this);

  @override
  String toString() => r'userProfileAsyncProvider';
}
