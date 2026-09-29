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

@ProviderFor(userProfile)
final userProfileProvider = UserProfileFamily._();

final class UserProfileProvider
    extends $FunctionalProvider<UserProfile?, UserProfile?, UserProfile?>
    with $Provider<UserProfile?> {
  UserProfileProvider._({
    required UserProfileFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userProfileHash();

  @override
  String toString() {
    return r'userProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<UserProfile?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserProfile? create(Ref ref) {
    final argument = this.argument as UserId;
    return userProfile(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfile? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfile?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userProfileHash() => r'12c541a0adb4efc2e7be8b551783f39ca33d479b';

final class UserProfileFamily extends $Family
    with $FunctionalFamilyOverride<UserProfile?, UserId> {
  UserProfileFamily._()
    : super(
        retry: null,
        name: r'userProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserProfileProvider call(UserId id) =>
      UserProfileProvider._(argument: id, from: this);

  @override
  String toString() => r'userProfileProvider';
}
