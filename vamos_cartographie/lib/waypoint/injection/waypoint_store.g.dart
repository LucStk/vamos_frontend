// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypointRemoteDatasource)
final waypointRemoteDatasourceProvider = WaypointRemoteDatasourceProvider._();

final class WaypointRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          WaypointRemoteDatasource,
          WaypointRemoteDatasource,
          WaypointRemoteDatasource
        >
    with $Provider<WaypointRemoteDatasource> {
  WaypointRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waypointRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waypointRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<WaypointRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WaypointRemoteDatasource create(Ref ref) {
    return waypointRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointRemoteDatasource>(value),
    );
  }
}

String _$waypointRemoteDatasourceHash() =>
    r'5813912072cea36c643646f53f8c12521c5f1b34';

@ProviderFor(waypointRepository)
final waypointRepositoryProvider = WaypointRepositoryProvider._();

final class WaypointRepositoryProvider
    extends
        $FunctionalProvider<
          WaypointRepository,
          WaypointRepository,
          WaypointRepository
        >
    with $Provider<WaypointRepository> {
  WaypointRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waypointRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waypointRepositoryHash();

  @$internal
  @override
  $ProviderElement<WaypointRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WaypointRepository create(Ref ref) {
    return waypointRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointRepository>(value),
    );
  }
}

String _$waypointRepositoryHash() =>
    r'fc3e46b08f14e0e5a7bdcf4e089cbbb764a095e7';

@ProviderFor(rawWaypointStore)
final rawWaypointStoreProvider = RawWaypointStoreProvider._();

final class RawWaypointStoreProvider
    extends
        $FunctionalProvider<
          ObservableWaypointStore,
          ObservableWaypointStore,
          ObservableWaypointStore
        >
    with $Provider<ObservableWaypointStore> {
  RawWaypointStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawWaypointStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawWaypointStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableWaypointStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableWaypointStore create(Ref ref) {
    return rawWaypointStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableWaypointStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableWaypointStore>(value),
    );
  }
}

String _$rawWaypointStoreHash() => r'5ac50524bc272229422165ae482cfe558a3e12b2';

@ProviderFor(waypointStore)
final waypointStoreProvider = WaypointStoreProvider._();

final class WaypointStoreProvider
    extends
        $FunctionalProvider<
          ObservableWaypointStore,
          ObservableWaypointStore,
          ObservableWaypointStore
        >
    with $Provider<ObservableWaypointStore> {
  WaypointStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waypointStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waypointStoreHash();

  @$internal
  @override
  $ProviderElement<ObservableWaypointStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObservableWaypointStore create(Ref ref) {
    return waypointStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObservableWaypointStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObservableWaypointStore>(value),
    );
  }
}

String _$waypointStoreHash() => r'd3f0cb2af326456f5bdff2caa91fb7ed3abc052e';
