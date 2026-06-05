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
    extends $NotifierProvider<WaypointsNotifier, Map<int, Waypoint>> {
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
  Override overrideWithValue(Map<int, Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Waypoint>>(value),
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

String _$waypointsNotifierHash() => r'418973af13ce4c53b0f335d015f85d2b4f13ef47';

final class WaypointsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          WaypointsNotifier,
          Map<int, Waypoint>,
          Map<int, Waypoint>,
          Map<int, Waypoint>,
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

abstract class _$WaypointsNotifier extends $Notifier<Map<int, Waypoint>> {
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

String _$waypointIdsHash() => r'99d4c19c6e27c27b3878be585997f9f5ca19fe25';

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

String _$waypointHash() => r'9df49af7553d691f3154db0fd86db877dcae35a3';

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
