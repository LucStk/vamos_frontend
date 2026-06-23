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
    extends $FunctionalProvider<WaypointStore, WaypointStore, WaypointStore>
    with $Provider<WaypointStore> {
  RawWaypointStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rawWaypointStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rawWaypointStoreHash();

  @$internal
  @override
  $ProviderElement<WaypointStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointStore create(Ref ref) {
    return rawWaypointStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointStore>(value),
    );
  }
}

String _$rawWaypointStoreHash() => r'91c7ff4cd33fbdedadfb38f33c16dfb9dc371353';

@ProviderFor(waypointStore)
final waypointStoreProvider = WaypointStoreProvider._();

final class WaypointStoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<WaypointId, Waypoint>>,
          Map<WaypointId, Waypoint>,
          Stream<Map<WaypointId, Waypoint>>
        >
    with
        $FutureModifier<Map<WaypointId, Waypoint>>,
        $StreamProvider<Map<WaypointId, Waypoint>> {
  WaypointStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'waypointStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$waypointStoreHash();

  @$internal
  @override
  $StreamProviderElement<Map<WaypointId, Waypoint>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<WaypointId, Waypoint>> create(Ref ref) {
    return waypointStore(ref);
  }
}

String _$waypointStoreHash() => r'ad3794145717574eb9bdc9c2d42db74c7da3b0c8';

@ProviderFor(waypoint)
final waypointProvider = WaypointFamily._();

final class WaypointProvider
    extends $FunctionalProvider<Waypoint?, Waypoint?, Waypoint?>
    with $Provider<Waypoint?> {
  WaypointProvider._({
    required WaypointFamily super.from,
    required WaypointId super.argument,
  }) : super(
         retry: null,
         name: r'waypointProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointHash();

  @override
  String toString() {
    return r'waypointProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Waypoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Waypoint? create(Ref ref) {
    final argument = this.argument as WaypointId;
    return waypoint(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Waypoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Waypoint?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointHash() => r'e3bb3ed87f7a2a6fe5f9c342e10ac2f59c94513a';

final class WaypointFamily extends $Family
    with $FunctionalFamilyOverride<Waypoint?, WaypointId> {
  WaypointFamily._()
    : super(
        retry: null,
        name: r'waypointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointProvider call(WaypointId id) =>
      WaypointProvider._(argument: id, from: this);

  @override
  String toString() => r'waypointProvider';
}
