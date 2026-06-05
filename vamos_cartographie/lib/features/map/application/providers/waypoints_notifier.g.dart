// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoints_notifier.dart';

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

@ProviderFor(WaypointsStore)
final waypointsStoreProvider = WaypointsStoreFamily._();

final class WaypointsStoreProvider
    extends $NotifierProvider<WaypointsStore, Map<int, Waypoint>> {
  WaypointsStoreProvider._({
    required WaypointsStoreFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointsStoreProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointsStoreHash();

  @override
  String toString() {
    return r'waypointsStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaypointsStore create() => WaypointsStore();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Waypoint>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointsStoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointsStoreHash() => r'c33e592ffe434b1a1536fbb9ae70b0ce946928f7';

final class WaypointsStoreFamily extends $Family
    with
        $ClassFamilyOverride<
          WaypointsStore,
          Map<int, Waypoint>,
          Map<int, Waypoint>,
          Map<int, Waypoint>,
          int
        > {
  WaypointsStoreFamily._()
    : super(
        retry: null,
        name: r'waypointsStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointsStoreProvider call(int tripId) =>
      WaypointsStoreProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointsStoreProvider';
}

abstract class _$WaypointsStore extends $Notifier<Map<int, Waypoint>> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  Map<int, Waypoint> build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<int, Waypoint>, Map<int, Waypoint>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, Waypoint>, Map<int, Waypoint>>,
              Map<int, Waypoint>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(waypointIds)
final waypointIdsProvider = WaypointIdsFamily._();

final class WaypointIdsProvider
    extends $FunctionalProvider<List<int>, List<int>, List<int>>
    with $Provider<List<int>> {
  WaypointIdsProvider._({
    required WaypointIdsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointIdsHash();

  @override
  String toString() {
    return r'waypointIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<int> create(Ref ref) {
    final argument = this.argument as int;
    return waypointIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointIdsHash() => r'280ac0f3ac0f35e08eab0c9a52463b86026cbc82';

final class WaypointIdsFamily extends $Family
    with $FunctionalFamilyOverride<List<int>, int> {
  WaypointIdsFamily._()
    : super(
        retry: null,
        name: r'waypointIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointIdsProvider call(int tripId) =>
      WaypointIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointIdsProvider';
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

String _$waypointHash() => r'e07358f8c327c0e01bdd8e42cbde3c137ab9e49a';

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

@ProviderFor(waypointLatLng)
final waypointLatLngProvider = WaypointLatLngFamily._();

final class WaypointLatLngProvider
    extends $FunctionalProvider<LatLng?, LatLng?, LatLng?>
    with $Provider<LatLng?> {
  WaypointLatLngProvider._({
    required WaypointLatLngFamily super.from,
    required (int, int) super.argument,
  }) : super(
         retry: null,
         name: r'waypointLatLngProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointLatLngHash();

  @override
  String toString() {
    return r'waypointLatLngProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<LatLng?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LatLng? create(Ref ref) {
    final argument = this.argument as (int, int);
    return waypointLatLng(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LatLng? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LatLng?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointLatLngProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointLatLngHash() => r'0603f009eaec67bf9c612891e760db2fc4f1bec7';

final class WaypointLatLngFamily extends $Family
    with $FunctionalFamilyOverride<LatLng?, (int, int)> {
  WaypointLatLngFamily._()
    : super(
        retry: null,
        name: r'waypointLatLngProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointLatLngProvider call(int tripId, int waypointId) =>
      WaypointLatLngProvider._(argument: (tripId, waypointId), from: this);

  @override
  String toString() => r'waypointLatLngProvider';
}
