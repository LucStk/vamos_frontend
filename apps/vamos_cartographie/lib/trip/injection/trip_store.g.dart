// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripRemoteDatasource)
final tripRemoteDatasourceProvider = TripRemoteDatasourceProvider._();

final class TripRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          TripRemoteDatasource,
          TripRemoteDatasource,
          TripRemoteDatasource
        >
    with $Provider<TripRemoteDatasource> {
  TripRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<TripRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripRemoteDatasource create(Ref ref) {
    return tripRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripRemoteDatasource>(value),
    );
  }
}

String _$tripRemoteDatasourceHash() =>
    r'901b1a49c05698679fe4e901f76731522489b50a';

@ProviderFor(tripRepository)
final tripRepositoryProvider = TripRepositoryProvider._();

final class TripRepositoryProvider
    extends $FunctionalProvider<TripRepository, TripRepository, TripRepository>
    with $Provider<TripRepository> {
  TripRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripRepositoryHash();

  @$internal
  @override
  $ProviderElement<TripRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripRepository create(Ref ref) {
    return tripRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripRepository>(value),
    );
  }
}

String _$tripRepositoryHash() => r'faf61679c894cea032e294dc345fdaf776d938d6';

@ProviderFor(TripStoreNotifier)
final tripStoreProvider = TripStoreNotifierProvider._();

final class TripStoreNotifierProvider
    extends $NotifierProvider<TripStoreNotifier, TripStore> {
  TripStoreNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripStoreNotifierHash();

  @$internal
  @override
  TripStoreNotifier create() => TripStoreNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStore>(value),
    );
  }
}

String _$tripStoreNotifierHash() => r'6291aceb47a1751d862437473e5ed8c0f4f25701';

abstract class _$TripStoreNotifier extends $Notifier<TripStore> {
  TripStore build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TripStore, TripStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TripStore, TripStore>,
              TripStore,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
