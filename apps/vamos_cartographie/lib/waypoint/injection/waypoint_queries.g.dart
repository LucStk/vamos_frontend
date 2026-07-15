// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypointNode)
final waypointNodeProvider = WaypointNodeFamily._();

final class WaypointNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<Waypoint>,
          GraphNode<Waypoint>,
          GraphNode<Waypoint>
        >
    with $Provider<GraphNode<Waypoint>> {
  WaypointNodeProvider._({
    required WaypointNodeFamily super.from,
    required (TripId, WaypointId) super.argument,
  }) : super(
         retry: null,
         name: r'waypointNodeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointNodeHash();

  @override
  String toString() {
    return r'waypointNodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<Waypoint>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<Waypoint> create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId);
    return waypointNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<Waypoint>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointNodeHash() => r'16e2bfe572bbbf838ef7297ab78325587372fbe3';

final class WaypointNodeFamily extends $Family
    with $FunctionalFamilyOverride<GraphNode<Waypoint>, (TripId, WaypointId)> {
  WaypointNodeFamily._()
    : super(
        retry: null,
        name: r'waypointNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointNodeProvider call(TripId tripId, WaypointId id) =>
      WaypointNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'waypointNodeProvider';
}

@ProviderFor(waypoint)
final waypointProvider = WaypointFamily._();

final class WaypointProvider
    extends
        $FunctionalProvider<
          NodeState<Waypoint>,
          NodeState<Waypoint>,
          NodeState<Waypoint>
        >
    with $Provider<NodeState<Waypoint>> {
  WaypointProvider._({
    required WaypointFamily super.from,
    required (TripId, WaypointId) super.argument,
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
  $ProviderElement<NodeState<Waypoint>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NodeState<Waypoint> create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId);
    return waypoint(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeState<Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeState<Waypoint>>(value),
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

String _$waypointHash() => r'88dc01e2a0dfb9a5d5e41e0d871378ee430f0b4a';

final class WaypointFamily extends $Family
    with $FunctionalFamilyOverride<NodeState<Waypoint>, (TripId, WaypointId)> {
  WaypointFamily._()
    : super(
        retry: null,
        name: r'waypointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointProvider call(TripId tripId, WaypointId id) =>
      WaypointProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'waypointProvider';
}

@ProviderFor(allWaypoint)
final allWaypointProvider = AllWaypointFamily._();

final class AllWaypointProvider
    extends $FunctionalProvider<List<Waypoint>, List<Waypoint>, List<Waypoint>>
    with $Provider<List<Waypoint>> {
  AllWaypointProvider._({
    required AllWaypointFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allWaypointProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allWaypointHash();

  @override
  String toString() {
    return r'allWaypointProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Waypoint>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Waypoint> create(Ref ref) {
    final argument = this.argument as TripId;
    return allWaypoint(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Waypoint> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Waypoint>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllWaypointProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allWaypointHash() => r'df0bb73a5b9ad0f9eb02d89027265e1781f4a690';

final class AllWaypointFamily extends $Family
    with $FunctionalFamilyOverride<List<Waypoint>, TripId> {
  AllWaypointFamily._()
    : super(
        retry: null,
        name: r'allWaypointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllWaypointProvider call(TripId tripId) =>
      AllWaypointProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allWaypointProvider';
}
