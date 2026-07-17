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
          GraphNode<WaypointFields>,
          GraphNode<WaypointFields>,
          GraphNode<WaypointFields>
        >
    with $Provider<GraphNode<WaypointFields>> {
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
  $ProviderElement<GraphNode<WaypointFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<WaypointFields> create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId);
    return waypointNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<WaypointFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<WaypointFields>>(value),
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

String _$waypointNodeHash() => r'f864fbb23cc1e467953f93fcca2926df426458b3';

final class WaypointNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          GraphNode<WaypointFields>,
          (TripId, WaypointId)
        > {
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
    extends $FunctionalProvider<WaypointState, WaypointState, WaypointState>
    with $Provider<WaypointState> {
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
  $ProviderElement<WaypointState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointState create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId);
    return waypoint(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointState>(value),
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

String _$waypointHash() => r'cc17a62e820bace95b5de5743d0b594aaf446808';

final class WaypointFamily extends $Family
    with $FunctionalFamilyOverride<WaypointState, (TripId, WaypointId)> {
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
    extends
        $FunctionalProvider<
          List<WaypointState>,
          List<WaypointState>,
          List<WaypointState>
        >
    with $Provider<List<WaypointState>> {
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
  $ProviderElement<List<WaypointState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<WaypointState> create(Ref ref) {
    final argument = this.argument as TripId;
    return allWaypoint(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WaypointState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WaypointState>>(value),
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

String _$allWaypointHash() => r'9812268cbf063b584a81a82c4ce4f8e297c92c0b';

final class AllWaypointFamily extends $Family
    with $FunctionalFamilyOverride<List<WaypointState>, TripId> {
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
