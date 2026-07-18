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

@ProviderFor(WaypointStoreNotifier)
final waypointStoreProvider = WaypointStoreNotifierFamily._();

final class WaypointStoreNotifierProvider
    extends $NotifierProvider<WaypointStoreNotifier, WaypointStore> {
  WaypointStoreNotifierProvider._({
    required WaypointStoreNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'waypointStoreProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointStoreNotifierHash();

  @override
  String toString() {
    return r'waypointStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaypointStoreNotifier create() => WaypointStoreNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointStore>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointStoreNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointStoreNotifierHash() =>
    r'5b6c4455b5d926028bab9cc8a53d2861dcad2169';

final class WaypointStoreNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaypointStoreNotifier,
          WaypointStore,
          WaypointStore,
          WaypointStore,
          TripId
        > {
  WaypointStoreNotifierFamily._()
    : super(
        retry: null,
        name: r'waypointStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  WaypointStoreNotifierProvider call(TripId tripId) =>
      WaypointStoreNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointStoreProvider';
}

abstract class _$WaypointStoreNotifier extends $Notifier<WaypointStore> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  WaypointStore build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WaypointStore, WaypointStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WaypointStore, WaypointStore>,
              WaypointStore,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
