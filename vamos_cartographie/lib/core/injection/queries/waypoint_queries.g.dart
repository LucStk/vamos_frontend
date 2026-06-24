// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoint_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(waypoint)
final waypointProvider = WaypointFamily._();

final class WaypointProvider
    extends $FunctionalProvider<Waypoint?, Waypoint?, Waypoint?>
    with $Provider<Waypoint?> {
  WaypointProvider._({
    required WaypointFamily super.from,
    required WaypointId super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Waypoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Waypoint? create(Ref ref) {
    final argument = this.argument as WaypointId;
    return waypoint(ref, argument);
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

String _$waypointHash() => r'06c814c42a0fda8a1d69c6256471b93cb40fe86e';

final class WaypointFamily extends $Family
    with $FunctionalFamilyOverride<Waypoint?, WaypointId> {
  WaypointFamily._()
    : super(
        retry: null,
        name: r'waypointProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointProvider call(WaypointId id) =>
      WaypointProvider._(argument: id, from: this);

  @override
  String toString() => r'waypointProvider';
}

@ProviderFor(waypointFromVertex)
final waypointFromVertexProvider = WaypointFromVertexFamily._();

final class WaypointFromVertexProvider
    extends $FunctionalProvider<Waypoint?, Waypoint?, Waypoint?>
    with $Provider<Waypoint?> {
  WaypointFromVertexProvider._({
    required WaypointFromVertexFamily super.from,
    required VertexId super.argument,
  }) : super(
         retry: null,
         name: r'waypointFromVertexProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waypointFromVertexHash();

  @override
  String toString() {
    return r'waypointFromVertexProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Waypoint?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Waypoint? create(Ref ref) {
    final argument = this.argument as VertexId;
    return waypointFromVertex(ref, argument);
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
    return other is WaypointFromVertexProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waypointFromVertexHash() =>
    r'dc3520b063c4497fc7903d3ef5dc632c0d3157cd';

final class WaypointFromVertexFamily extends $Family
    with $FunctionalFamilyOverride<Waypoint?, VertexId> {
  WaypointFromVertexFamily._()
    : super(
        retry: null,
        name: r'waypointFromVertexProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaypointFromVertexProvider call(VertexId vertexId) =>
      WaypointFromVertexProvider._(argument: vertexId, from: this);

  @override
  String toString() => r'waypointFromVertexProvider';
}
