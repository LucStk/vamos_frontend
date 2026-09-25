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
        isAutoDispose: false,
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
    r'b7972625b6bfe2ad0db9495b143cbbcd23f44695';

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
        isAutoDispose: false,
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
    r'9c271beee52a1f48fbf50868c03611fb9a4a03eb';

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
    r'87976358e5ae754baebcf21d45287750b6e168b6';

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
