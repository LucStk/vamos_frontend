// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WaypointsNotifier)
final waypointsProvider = WaypointsNotifierFamily._();

final class WaypointsNotifierProvider
    extends $AsyncNotifierProvider<WaypointsNotifier, Map<int, Waypoint>> {
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

  @override
  bool operator ==(Object other) {
    return other is WaypointsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointsNotifierHash() => r'7dff63c69269dccd5c34df113cac688df08668b1';

final class WaypointsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaypointsNotifier,
          AsyncValue<Map<int, Waypoint>>,
          Map<int, Waypoint>,
          FutureOr<Map<int, Waypoint>>,
          int
        > {
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

abstract class _$WaypointsNotifier extends $AsyncNotifier<Map<int, Waypoint>> {
  late final _$args = ref.$arg as int;
  int get tripId => _$args;

  FutureOr<Map<int, Waypoint>> build(int tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Map<int, Waypoint>>, Map<int, Waypoint>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Map<int, Waypoint>>, Map<int, Waypoint>>,
              AsyncValue<Map<int, Waypoint>>,
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

String _$waypointMapHash() => r'9e49b378f2749afe0497da9131ad79ba3ada8042';

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

@ProviderFor(waypointIds)
final waypointIdsProvider = WaypointIdsFamily._();

final class WaypointIdsProvider
    extends $FunctionalProvider<Iterable<int>, Iterable<int>, Iterable<int>>
    with $Provider<Iterable<int>> {
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
  $ProviderElement<Iterable<int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Iterable<int> create(Ref ref) {
    final argument = this.argument as int;
    return waypointIds(ref, argument);
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
    return other is WaypointIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointIdsHash() => r'90ee06a3d44097a6c004e7bcf879c0b6eff54564';

final class WaypointIdsFamily extends $Family
    with $FunctionalFamilyOverride<Iterable<int>, int> {
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

String _$waypointHash() => r'acbec1e0789095d1842584613ccaf911ec3d77f3';

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
