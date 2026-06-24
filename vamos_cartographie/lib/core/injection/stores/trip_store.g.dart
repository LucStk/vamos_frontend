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

@ProviderFor(rawTripStore)
final rawTripStoreProvider = RawTripStoreProvider._();

final class RawTripStoreProvider
    extends
        $FunctionalProvider<
          ObservableTripStore,
          ObservableTripStore,
          ObservableTripStore
        >
    with $Provider<ObservableTripStore> {
  RawTripStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawTripStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawTripStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableTripStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableTripStore create(Ref ref) {
    return rawTripStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableTripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableTripStore>(value),
    );
  }
}

String _$rawTripStoreHash() => r'cbbea334ba59d6164e6e5eb0fb04d12a53c9ae33';

@ProviderFor(tripStore)
final tripStoreProvider = TripStoreProvider._();

final class TripStoreProvider
    extends
        $FunctionalProvider<
          ObservableTripStore,
          ObservableTripStore,
          ObservableTripStore
        >
    with $Provider<ObservableTripStore> {
  TripStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableTripStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableTripStore create(Ref ref) {
    return tripStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableTripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableTripStore>(value),
    );
  }
}

String _$tripStoreHash() => r'57a8e4909314d2a36e2bb148e8646319ff819b5f';
