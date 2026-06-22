// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_provider.dart';

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

@ProviderFor(waypointHandler)
final waypointHandlerProvider = WaypointHandlerFamily._();

final class WaypointHandlerProvider
    extends
        $FunctionalProvider<WaypointHandler, WaypointHandler, WaypointHandler>
    with $Provider<WaypointHandler> {
  WaypointHandlerProvider._({
    required WaypointHandlerFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'waypointHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointHandlerHash();

  @override
  String toString() {
    return r'waypointHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<WaypointHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointHandler create(Ref ref) {
    final argument = this.argument as TripId;
    return waypointHandler(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointHandler>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointHandlerHash() => r'968064166e43a5b1cdd7603c5534435763beae63';

final class WaypointHandlerFamily extends $Family
    with $FunctionalFamilyOverride<WaypointHandler, TripId> {
  WaypointHandlerFamily._()
    : super(
        retry: null,
        name: r'waypointHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointHandlerProvider call(TripId tripId) =>
      WaypointHandlerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointHandlerProvider';
}
