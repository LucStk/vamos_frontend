// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRemoteDatasource)
final userRemoteDatasourceProvider = UserRemoteDatasourceProvider._();

final class UserRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          UserProfileDatasource,
          UserProfileDatasource,
          UserProfileDatasource
        >
    with $Provider<UserProfileDatasource> {
  UserRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserProfileDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserProfileDatasource create(Ref ref) {
    return userRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfileDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfileDatasource>(value),
    );
  }
}

String _$userRemoteDatasourceHash() =>
    r'608064137bb455065d2b415a74b527a1ca580785';

@ProviderFor(userProfileRepository)
final userProfileRepositoryProvider = UserProfileRepositoryProvider._();

final class UserProfileRepositoryProvider
    extends
        $FunctionalProvider<
          UserProfileRepository,
          UserProfileRepository,
          UserProfileRepository
        >
    with $Provider<UserProfileRepository> {
  UserProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserProfileRepository create(Ref ref) {
    return userProfileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfileRepository>(value),
    );
  }
}

String _$userProfileRepositoryHash() =>
    r'ded6134b92d32f947b6ef4f3b907638f226379f4';

@ProviderFor(MeNotifier)
final meProvider = MeNotifierProvider._();

final class MeNotifierProvider extends $AsyncNotifierProvider<MeNotifier, Me> {
  MeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meNotifierHash();

  @$internal
  @override
  MeNotifier create() => MeNotifier();
}

String _$meNotifierHash() => r'0d9bb2f2cbca13a2d0ca531ce78a25211329919f';

abstract class _$MeNotifier extends $AsyncNotifier<Me> {
  FutureOr<Me> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Me>, Me>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Me>, Me>,
              AsyncValue<Me>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
