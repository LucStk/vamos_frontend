// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ======================================================
/// COLLECTION
/// ======================================================

@ProviderFor(waypointVertex)
final waypointVertexProvider = WaypointVertexFamily._();

/// ======================================================
/// COLLECTION
/// ======================================================

final class WaypointVertexProvider
    extends $FunctionalProvider<Vertex, Vertex, Vertex>
    with $Provider<Vertex> {
  /// ======================================================
  /// COLLECTION
  /// ======================================================
  WaypointVertexProvider._({
    required WaypointVertexFamily super.from,
    required (Id<Trip>, Id<Waypoint>) super.argument,
  }) : super(
         retry: null,
         name: r'waypointVertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointVertexHash();

  @override
  String toString() {
    return r'waypointVertexProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Vertex> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Vertex create(Ref ref) {
    final argument = this.argument as (Id<Trip>, Id<Waypoint>);
    return waypointVertex(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Vertex value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Vertex>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WaypointVertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointVertexHash() => r'4eae14fc91abdfcc51fc1682d54170c02870a133';

/// ======================================================
/// COLLECTION
/// ======================================================

final class WaypointVertexFamily extends $Family
    with $FunctionalFamilyOverride<Vertex, (Id<Trip>, Id<Waypoint>)> {
  WaypointVertexFamily._()
    : super(
        retry: null,
        name: r'waypointVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ======================================================
  /// COLLECTION
  /// ======================================================

  WaypointVertexProvider call(Id<Trip> tripId, Id<Waypoint> waypointId) =>
      WaypointVertexProvider._(argument: (tripId, waypointId), from: this);

  @override
  String toString() => r'waypointVertexProvider';
}
