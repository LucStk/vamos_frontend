// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoints_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaypointsNotifier)
final waypointsProvider = WaypointsNotifierFamily._();

final class WaypointsNotifierProvider
    extends $NotifierProvider<WaypointsNotifier, void> {
  WaypointsNotifierProvider._({
    required WaypointsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointsNotifierHash();

  @override
  String toString() {
    return r'waypointsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WaypointsNotifier create() => WaypointsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointsNotifierHash() => r'cfbc5a0fbfce2c2a514d112c3c559eb95df3f331';

final class WaypointsNotifierFamily extends $Family
    with $ClassFamilyOverride<WaypointsNotifier, void, void, void, int> {
  WaypointsNotifierFamily._()
    : super(
        retry: null,
        name: r'waypointsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointsNotifierProvider call(int tripId) =>
      WaypointsNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointsProvider';
}

abstract class _$WaypointsNotifier extends $Notifier<void> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  void build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(waypointMap)
final waypointMapProvider = WaypointMapFamily._();

final class WaypointMapProvider
    extends
        $FunctionalProvider<
          Map<int, Waypoint>,
          Map<int, Waypoint>,
          Map<int, Waypoint>
        >
    with $Provider<Map<int, Waypoint>> {
  WaypointMapProvider._({
    required WaypointMapFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointMapHash();

  @override
  String toString() {
    return r'waypointMapProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<int, Waypoint>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<int, Waypoint> create(Ref ref) {
    final argument = this.argument as int;
    return waypointMap(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Waypoint>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointMapProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointMapHash() => r'4175448389427245e2f418071bae346829a4b166';

final class WaypointMapFamily extends $Family
    with $FunctionalFamilyOverride<Map<int, Waypoint>, int> {
  WaypointMapFamily._()
    : super(
        retry: null,
        name: r'waypointMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointMapProvider call(int tripId) =>
      WaypointMapProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointMapProvider';
}

@ProviderFor(waypointsIds)
final waypointsIdsProvider = WaypointsIdsFamily._();

final class WaypointsIdsProvider
    extends $FunctionalProvider<Iterable<int>, Iterable<int>, Iterable<int>>
    with $Provider<Iterable<int>> {
  WaypointsIdsProvider._({
    required WaypointsIdsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointsIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointsIdsHash();

  @override
  String toString() {
    return r'waypointsIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Iterable<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Iterable<int> create(Ref ref) {
    final argument = this.argument as int;
    return waypointsIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<int>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointsIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointsIdsHash() => r'375cb3db392e3f208f4a7f8a916a2ab23e5a40fc';

final class WaypointsIdsFamily extends $Family
    with $FunctionalFamilyOverride<Iterable<int>, int> {
  WaypointsIdsFamily._()
    : super(
        retry: null,
        name: r'waypointsIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointsIdsProvider call(int tripId) =>
      WaypointsIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointsIdsProvider';
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

String _$waypointHash() => r'fb733c07c2fff4bb99b1e996df73eeba0403875e';

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

@ProviderFor(waypointsByVertex)
final waypointsByVertexProvider = WaypointsByVertexFamily._();

final class WaypointsByVertexProvider
    extends
        $FunctionalProvider<
          Map<int, Waypoint>,
          Map<int, Waypoint>,
          Map<int, Waypoint>
        >
    with $Provider<Map<int, Waypoint>> {
  WaypointsByVertexProvider._({
    required WaypointsByVertexFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waypointsByVertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointsByVertexHash();

  @override
  String toString() {
    return r'waypointsByVertexProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<int, Waypoint>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<int, Waypoint> create(Ref ref) {
    final argument = this.argument as int;
    return waypointsByVertex(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Waypoint>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointsByVertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointsByVertexHash() => r'4d1c48849b7d85e07a8e731d48e9dd0ec910bc27';

final class WaypointsByVertexFamily extends $Family
    with $FunctionalFamilyOverride<Map<int, Waypoint>, int> {
  WaypointsByVertexFamily._()
    : super(
        retry: null,
        name: r'waypointsByVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointsByVertexProvider call(int tripId) =>
      WaypointsByVertexProvider._(argument: tripId, from: this);

  @override
  String toString() => r'waypointsByVertexProvider';
}
