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
    extends $FunctionalProvider<TripStore, TripStore, TripStore>
    with $Provider<TripStore> {
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
  $ProviderElement<TripStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripStore create(Ref ref) {
    return rawTripStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripStore>(value),
    );
  }
}

String _$rawTripStoreHash() => r'2330277caf76bb253497ab03b29a75fff822f8a8';

@ProviderFor(tripStore)
final tripStoreProvider = TripStoreProvider._();

final class TripStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<TripId, Trip>>,
          Map<TripId, Trip>,
          Stream<Map<TripId, Trip>>
        >
    with
        $FutureModifier<Map<TripId, Trip>>,
        $StreamProvider<Map<TripId, Trip>> {
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
  $StreamProviderElement<Map<TripId, Trip>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<TripId, Trip>> create(Ref ref) {
    return tripStore(ref);
  }
}

String _$tripStoreHash() => r'dbcf587449c1d83abef47c3204e9ba7d3ff18940';
