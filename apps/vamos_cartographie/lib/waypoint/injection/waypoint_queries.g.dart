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

String _$waypointNodeHash() => r'05617377b215961cfb8b1edc53e2a7af6c031a86';

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
    extends $FunctionalProvider<WaypointFields, WaypointFields, WaypointFields>
    with $Provider<WaypointFields> {
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
  $ProviderElement<WaypointFields> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WaypointFields create(Ref ref) {
    final argument = this.argument as (TripId, WaypointId);
    return waypoint(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WaypointFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WaypointFields>(value),
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

String _$waypointHash() => r'8081ddca66ec6c9d98e0c99d08ac47ea974fd399';

final class WaypointFamily extends $Family
    with $FunctionalFamilyOverride<WaypointFields, (TripId, WaypointId)> {
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

@ProviderFor(allWaypointIds)
final allWaypointIdsProvider = AllWaypointIdsFamily._();

final class AllWaypointIdsProvider
    extends
        $FunctionalProvider<
          List<WaypointId>,
          List<WaypointId>,
          List<WaypointId>
        >
    with $Provider<List<WaypointId>> {
  AllWaypointIdsProvider._({
    required AllWaypointIdsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allWaypointIdsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allWaypointIdsHash();

  @override
  String toString() {
    return r'allWaypointIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<WaypointId>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<WaypointId> create(Ref ref) {
    final argument = this.argument as TripId;
    return allWaypointIds(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WaypointId> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WaypointId>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllWaypointIdsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allWaypointIdsHash() => r'4d9715f6fe92ae8547b37b3cd20f7645c9455cda';

final class AllWaypointIdsFamily extends $Family
    with $FunctionalFamilyOverride<List<WaypointId>, TripId> {
  AllWaypointIdsFamily._()
    : super(
        retry: null,
        name: r'allWaypointIdsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AllWaypointIdsProvider call(TripId tripId) =>
      AllWaypointIdsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allWaypointIdsProvider';
}
