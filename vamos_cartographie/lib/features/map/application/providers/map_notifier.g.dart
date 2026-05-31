// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_waypointRepository)
final _waypointRepositoryProvider = _WaypointRepositoryProvider._();

final class _WaypointRepositoryProvider
    extends
        $FunctionalProvider<
          IWaypointRepository,
          IWaypointRepository,
          IWaypointRepository
        >
    with $Provider<IWaypointRepository> {
  _WaypointRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_waypointRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_waypointRepositoryHash();

  @$internal
  @override
  $ProviderElement<IWaypointRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IWaypointRepository create(Ref ref) {
    return _waypointRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IWaypointRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IWaypointRepository>(value),
    );
  }
}

String _$_waypointRepositoryHash() =>
    r'36de92de7b59a342926efd16b91d07398c45ee60';

@ProviderFor(MapStateNotifier)
final mapStateProvider = MapStateNotifierFamily._();

final class MapStateNotifierProvider
    extends $NotifierProvider<MapStateNotifier, MapState> {
  MapStateNotifierProvider._({
    required MapStateNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'mapStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapStateNotifierHash();

  @override
  String toString() {
    return r'mapStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MapStateNotifier create() => MapStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapStateNotifierHash() => r'459b5956462f9255df4cc05e695b9cc1b835b8fe';

final class MapStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MapStateNotifier,
          MapState,
          MapState,
          MapState,
          int
        > {
  MapStateNotifierFamily._()
    : super(
        retry: null,
        name: r'mapStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapStateNotifierProvider call(int tripId) =>
      MapStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mapStateProvider';
}

abstract class _$MapStateNotifier extends $Notifier<MapState> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  MapState build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapState, MapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapState, MapState>,
              MapState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(waypoint)
final waypointProvider = WaypointFamily._();

final class WaypointProvider
    extends $FunctionalProvider<Waypoint?, Waypoint?, Waypoint?>
    with $Provider<Waypoint?> {
  WaypointProvider._({
    required WaypointFamily super.from,
    required (int, int) super.argument,
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
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Waypoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Waypoint? create(Ref ref) {
    final argument = this.argument as (int, int);
    return waypoint(ref, argument.$1, argument.$2);
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

String _$waypointHash() => r'313b129dffaa673a6f70fdc71f5e7dadb9834bcf';

final class WaypointFamily extends $Family
    with $FunctionalFamilyOverride<Waypoint?, (int, int)> {
  WaypointFamily._()
    : super(
        retry: null,
        name: r'waypointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointProvider call(int tripId, int waypointId) =>
      WaypointProvider._(argument: (tripId, waypointId), from: this);

  @override
  String toString() => r'waypointProvider';
}
